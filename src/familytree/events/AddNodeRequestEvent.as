package familytree.events
{
	import familytree.models.Node;
	
	import flash.events.Event;
	
	public class AddNodeRequestEvent extends NodeEvent
	{
		public static const TYPE:String = "addNodeRequest";
		
		public var relation:String;
				
		public function AddNodeRequestEvent(node:Node, relation:String)
		{
			super(AddNodeRequestEvent.TYPE, node);
			this.relation = relation;
		}		
	}
}