package familytree.components.layouts
{
	import familytree.components.*;
	import familytree.components.layouts.helpers.UINodeWrapper;
	import familytree.enums.Sex;
	import familytree.models.Node;
	
	import mx.core.ILayoutElement;
	import mx.core.IVisualElement;
	import mx.core.mx_internal;
	import mx.resources.ResourceManager;
	
	import spark.components.supportClasses.GroupBase;
	import spark.core.SpriteVisualElement;
	import spark.layouts.BasicLayout;
	import spark.layouts.supportClasses.LayoutBase;
	import spark.layouts.supportClasses.LayoutElementHelper;

	use namespace mx_internal;
	
	public class BasicTreeLayout extends LayoutBase
	{
		public static const UP:int = 0;
		public static const DOWN:int = 1;
		
		public static const OFFSPRING:int = 2;
		public static const ANCESTRY:int = 3;
		
		public var root:Node;		
		public var direction:int = UP;
		public var mode:int = ANCESTRY;
		
		
		
		public function BasicTreeLayout()
		{
			super();
		}			
		
		private var nodes:Array;
		
		protected function placeNode(w:UINodeWrapper, withSpouse:Boolean = false):Array {
			var nextLevel:Array;
			
			if (this.mode == BasicTreeLayout.ANCESTRY)
				nextLevel = [w.node.mother, w.node.father];
			else nextLevel = w.node.children;
			
			nextLevel = nextLevel.map(getWrapper, this); 
			nextLevel = nextLevel.filter(function(w:Object,i:int, a:Array):Boolean{return w != null;});								
			w.nextLevel = nextLevel;
			
			var result:Array = [];
			for each(var u:UINodeWrapper in nextLevel) {
				var uResult:Array = placeNode(u, mode == BasicTreeLayout.OFFSPRING);
				
				var shift:int = 0xffff;
				for (var i:int = 0; i < Math.min(result.length, uResult.length); ++i)
					shift = Math.min(shift, uResult[i][0] - result[i][1]);
				if (shift == 0xffff) shift = 0;
				else shift -= 20;
				u.shift(-shift, direction==BasicTreeLayout.UP?-120:120);
				
				for (var i:int = 0; i< Math.min(result.length, uResult.length); ++i) {
					result[i][1] = uResult[i][1] - shift;
				}
				for (var i:int = result.length; i < uResult.length; ++i) {
					result.push([uResult[i][0]-shift, uResult[i][1] - shift]);
				}
			}
			
			var s:UINodeWrapper;
			if (withSpouse && (s = getWrapper(w.node.spouse))) {
				if(result.length) {
					w.x = (nextLevel[0].x + nextLevel[nextLevel.length-1].x) / 2;
					if (mode == BasicTreeLayout.OFFSPRING) {
						w.x += (w.node.sex?85:-85);
					}
				}			
				if (w.node.sex) {
					s.x = w.x - 170;
					result.unshift([s.x, s.x+320]);//!!!!!!!!!
				} else {
					s.x = w.x + 170;
					result.unshift([w.x, w.x+320]);//!!!!!!!!!
				}
				w.nextLevel.push(s);
				if (result[0][0] < 0) {
					shift = -result[0][0];
					w.shift(shift, 0);
					for (var i:int = 0; i<result.length; ++i) {
						result[i][0] += shift;
						result[i][1] += shift;
					}					
				}
									
			} else {
				if (nextLevel.length) {
					w.x = (nextLevel[0].x + nextLevel[nextLevel.length-1].x) / 2;
				}
				result.unshift([w.x, w.x+150]);
			}
			var a:int;			
			if (w.node == root) {
				a = 10;
			} 
			return result;
		}
		
		public function getWrapper(n:Node,i:int = 0, a:Array = null):UINodeWrapper {
			if (!n) return null;
			else return nodes[n.id];
		}
		
		override public function updateDisplayList(w:Number, h:Number):void {
			super.updateDisplayList(w,h);
			
			if (!root) return;
			
			nodes = [];
		
			var tree:Tree = this.target as Tree;
			
			for (var i:int = 0; i < target.numElements; ++i) {
				if (target.getElementAt(i) instanceof UINode) {
					var wrapper:UINodeWrapper = new UINodeWrapper(target.getElementAt(i) as UINode);
					wrapper.reset();
					nodes[wrapper.id] = wrapper;
				}				
			}
			
			var result:Array = placeNode(getWrapper(root), true);
					
			var _left:int = 0xffff;// 1440/2-75-uiNode.x;
			var _right:int = -0xffff;
			
			for(var i:int = 0; i < result.length; ++i) {
				_left = Math.min(_left, result[i][0]);
				_right = Math.max(_right, result[i][1]);
			}
			
			getWrapper(root).shift(-_left+10, direction==BasicTreeLayout.UP?120*result.length - 110:10);
			__width = _right - _left + 20;
			__height = 120*result.length - 10;
			
			drawLines();
			
			this.target.invalidateSize();
		}
		
		protected var __width:int = 600;
		protected var __height:int = 600;
		override public function measure():void {
			target.measuredHeight = target.measuredMinHeight = __height;
			target.measuredWidth = target.measuredMinWidth = __width;
		}
		
		protected function drawLines():void {
			var linesDir:Boolean = (mode == BasicTreeLayout.ANCESTRY);
			if (direction == BasicTreeLayout.DOWN) linesDir = !linesDir;
			
			var lines:SpriteVisualElement = Tree(target).lines;
			lines.graphics.clear();
			lines.graphics.lineStyle(3, 0xE3E3E3);
			
			for each(var w:UINodeWrapper in nodes) {
				var p:UINodeWrapper;				
				if (p = getWrapper(w.node.mother)) {
					w.isChild = true;
					p.isParent = true;
					lines.graphics.moveTo(w.x + 75, (w.y + p.y)/2 + 45);
					lines.graphics.lineTo(p.x + 75, (w.y + p.y)/2 + 45);
				}
				
				if (p = getWrapper(w.node.father)) {
					w.isChild = true;
					p.isParent = true;
					lines.graphics.moveTo(w.x + 75, (w.y + p.y)/2 + 45);
					lines.graphics.lineTo(p.x + 75, (w.y + p.y)/2 + 45);					
				}				
				
				if (p = getWrapper(w.node.spouse)) {
					w.isSpouse = true;
				}				
			}
			
			for each(var w:UINodeWrapper in nodes) {
				if (w.isChild) {
					lines.graphics.moveTo(w.x + 75, w.y + (linesDir? 0 : 90));
					lines.graphics.lineTo(w.x + 75, w.y + (linesDir? - 15 : 105));					
				}

				if (w.isParent) {
					lines.graphics.moveTo(w.x + 75, w.y + (linesDir? 90 : 0));
					lines.graphics.lineTo(w.x + 75, w.y + (linesDir? 105 : -15));
/*					if (w.isSpouse && w.node.sex==Sex.FEMALE) {
						lines.graphics.lineTo(getWrapper(w.node.spouse).x + 75, w.y + (linesDir? 105 : -15));	
					}*/					
				}
				if (w.isSpouse && w.node.sex==Sex.FEMALE) {
					lines.graphics.moveTo(w.x + 150, w.y + 45);
					lines.graphics.lineTo(getWrapper(w.node.spouse).x , w.y + 45);						
				}
			}
		}
	}
}