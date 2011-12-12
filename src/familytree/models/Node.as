package familytree.models
{
	import flash.events.EventDispatcher;
	
	import mx.events.PropertyChangeEvent;
	import mx.messaging.channels.StreamingAMFChannel;

	[Bindable]
	public class Node extends EventDispatcher
	{
		public var children:Array = [];
		public var mother:Node;
		public var father:Node;
		public var spouse:Node;
		
		public var firstName:String;
		private var _lastName:String;
		public var birthDate:Date;
		public var deathDate:Date;
		public var sex:int;
		public var id:int = 0;		
				
		public function Node()
		{
		}

		public function get lastName():String
		{
			return _lastName;
		}

		public function set lastName(value:String):void
		{
			_lastName = value;
			//dispatchEvent(new PropertyChangeEvent("propertyChange"));
		}

	}
}