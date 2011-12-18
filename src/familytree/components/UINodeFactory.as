package familytree.components
{
	import familytree.models.Node;
	import familytree.components.skins.UINodeBaseSkin;

	public class UINodeFactory
	{
		private static var uiNodes:Array = [];
		
		public static function get(n:Node):UINode {
			if (!uiNodes[n.id]) {
				var uiNode:UINode = new UINode();
				uiNode.setStyle("skinClass",familytree.components.skins.UINodeBaseSkin);
				uiNode.node = n;		
				uiNodes[n.id] = uiNode;
			}
			return uiNodes[n.id];			
		}
	}
}