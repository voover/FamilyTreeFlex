package familytree.components.layouts.helpers
{
	import familytree.components.UINode;
	import familytree.models.Node;

	public class UINodeWrapper
	{
		private var uiNode:UINode;
		public function UINodeWrapper(uiNode:UINode)
		{
			this.uiNode = uiNode;
		}
		public function reset():void {
			uiNode.setLayoutBoundsSize(150, 90);
			uiNode.setLayoutBoundsPosition(0,0);
			isParent = isChild = false;
		}
		public function get id():int {
			return uiNode.node.id;
		}
		
		public function notNull(o:Object, i:int, a:Array):Boolean {
			return o != null;
		}
				
		public function shift(x:int, y:int):void {
			uiNode.x += x;
			uiNode.y += y;
			for each(var n:UINodeWrapper in nextLevel) {
				n.shift(x, y);
			}
		}
		
		public var nextLevel:Array = [];
		public function set x(v:Number):void {
			uiNode.x = v;
		}
		
		public function get x():Number {
			return uiNode.x;
		}
		
		public function get y():Number {
			return uiNode.y;
		}
		
		public function get node():Node {
			return uiNode.node;
		}
		
		public var isChild:Boolean = false;
		public var isParent:Boolean = false;
		public var isSpouse:Boolean = false;
	}
}
