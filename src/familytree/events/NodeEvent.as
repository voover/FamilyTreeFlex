package familytree.events
{
	import familytree.models.Node;
	
	import flash.events.Event;
	
	public class NodeEvent extends Event
	{
	
		public var node:Node;
		public static const EDIT_NODE_REQUEST:String = "editNodeRequest";
		
		public function NodeEvent(type:String, node:Node)
		{
			super(type, true);
			this.node = node;
		}		
	}
}