package familytree.components
{
	
	import familytree.events.*;
	import familytree.models.Node;
	import familytree.enums.Relations;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.events.PropertyChangeEvent;
	
	import spark.components.supportClasses.ButtonBase;
	import spark.components.supportClasses.SkinnableComponent;
	import spark.components.supportClasses.TextBase;
	import spark.core.SpriteVisualElement;
	import spark.formatters.DateTimeFormatter;
	
	
	public class UINode extends SkinnableComponent
	{	
		[SkinPart(required=true)]
		public var firstNameLabel:TextBase;

		[SkinPart(required=true)]
		public var lastNameLabel:TextBase;
		
		[SkinPart]
		public var birthDateLabel:TextBase;
		
		[SkinPart]
		public var deathDateLabel:TextBase;		
		
		[SkinPart]
		public var addMotherButton:ButtonBase;
		
		[SkinPart]
		public var addFatherButton:ButtonBase;
		
		[SkinPart]
		public var addChildButton:ButtonBase;
		
		[SkinPart]
		public var addSpouseButton:ButtonBase;
		
		[SkinPart]
		public var editNodeButton:ButtonBase;
		
		private var dateFormatter:DateTimeFormatter = new DateTimeFormatter();
		
		public function UINode()
		{
			super();
			dateFormatter.dateTimePattern = "dd.MM.yyyy";
			//init();
		}
		
		private var _node:Node;
		public function get node():Node {
			return _node;
		}
		public function set node(n:Node):void {
			this._node = n;
			n.addEventListener("propertyChange", onPropertyChanged);
			invalidateProperties();
		}
		
		protected function onPropertyChanged(event:Event):void {
			invalidateProperties();
		}
						
		override protected function commitProperties():void {
			super.commitProperties();
			if (!this._node) return;
			if (this.firstNameLabel) this.firstNameLabel.text = _node.firstName;
			if (this.lastNameLabel) this.lastNameLabel.text = _node.lastName;	
			if (this.birthDateLabel) birthDateLabel.text = "* "+dateFormatter.format(node.birthDate);
			if (this.deathDateLabel) deathDateLabel.text = node.deathDate ? ("+ "+dateFormatter.format(node.deathDate)) : "";	
			if (addMotherButton) addMotherButton.enabled = ! _node.mother;
			if (addFatherButton) addFatherButton.enabled = ! _node.father;
			if (addSpouseButton) addSpouseButton.enabled = ! _node.spouse;
		}
		
		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		} 
		
		override protected function partAdded(partName:String, instance:Object) : void
		{
			super.partAdded(partName, instance);
			if (!node) return;
			if (instance == firstNameLabel) firstNameLabel.text = node.firstName;
			if (instance == lastNameLabel) lastNameLabel.text = node.lastName;
			if (instance == birthDateLabel) birthDateLabel.text = "* "+dateFormatter.format(node.birthDate);
			if (instance == deathDateLabel) deathDateLabel.text = node.deathDate ? ("+ "+dateFormatter.format(node.deathDate)) : "";
			if (instance == addMotherButton) {
				addMotherButton.enabled = ! _node.mother;
				addMotherButton.addEventListener(MouseEvent.CLICK, onButtonClicked);
			}
			if (instance == addFatherButton) {
				addFatherButton.enabled = ! _node.father ;
				addFatherButton.addEventListener(MouseEvent.CLICK, onButtonClicked);
			}
			if (instance == addSpouseButton) {
				addSpouseButton.enabled = ! _node.spouse ;
				addSpouseButton.addEventListener(MouseEvent.CLICK, onButtonClicked);
			}		
			if (instance == addChildButton) {
				addChildButton.addEventListener(MouseEvent.CLICK, onButtonClicked);
			}
			if (instance == editNodeButton) {
				editNodeButton.addEventListener(MouseEvent.CLICK, onButtonClicked);
			}
		}
		
		protected function onButtonClicked(event:MouseEvent):void {
			skin.currentState = "Over";			
			if (event.target == addMotherButton) dispatchEvent(new AddNodeRequestEvent(this.node, Relations.MOTHER));
			if (event.target == addFatherButton) dispatchEvent(new AddNodeRequestEvent(this.node,Relations.FATHER));
			if (event.target == addChildButton) dispatchEvent(new AddNodeRequestEvent(this.node, Relations.CHILD));
			if (event.target == addSpouseButton) dispatchEvent(new AddNodeRequestEvent(this.node, Relations.SPOUSE));
			if (event.target == editNodeButton) dispatchEvent(new NodeEvent(NodeEvent.EDIT_NODE_REQUEST, this.node));
		}
		
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			super.partRemoved(partName, instance);
		}
		
	}
}