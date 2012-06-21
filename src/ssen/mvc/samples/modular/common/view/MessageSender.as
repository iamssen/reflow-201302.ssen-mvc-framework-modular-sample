package ssen.mvc.samples.modular.common.view {

	import flash.events.Event;
	import flash.events.MouseEvent;

	import mx.core.UIComponent;

	import spark.components.Button;
	import spark.components.Group;
	import spark.components.TextInput;
	import spark.components.ToggleButton;
	import spark.components.supportClasses.SkinnableComponent;

	public class MessageSender extends SkinnableComponent {
		public const TO_ALL:String="toAll";
		public const TO_PARENT:String="toParent";
		public const TO_CHILDREN:String="toChildren";
		public const TO_SELF:String="toSelf";
		public const CHANGE_GLOBAL:String="changeGlobal";
		public const CHANGE_CURRENT:String="changeCurrent";
		public const CREATE_CHILD:String="createChild";
		public const CLEAR_MESSAGES:String="clearMessages";


		[SkinPart(required="true")]
		public var toAll:Button;

		[SkinPart(required="true")]
		public var toSelf:Button;

		[SkinPart(required="true")]
		public var toChildren:Button;

		[SkinPart(required="true")]
		public var toParent:Button;

		[SkinPart(required="true")]
		public var penetrate:ToggleButton;

		[SkinPart]
		public var input:TextInput;

		[SkinPart(required="true")]
		public var changeGlobal:Button;

		[SkinPart(required="true")]
		public var changeCurrent:Button;

		[SkinPart]
		public var createChild:Button;

		[SkinPart]
		public var clearMessages:Button;

		//=========================================================
		// 
		//=========================================================
		public function getText():String {
			return (input === null) ? "input is null!" : input.text;
		}

		public function getPenetrate():Boolean {
			return (penetrate === null) ? false : penetrate.selected;
		}

		public function deconstruct():void {
			detachSkin();
		}

		//=========================================================
		// 
		//=========================================================
		override protected function partAdded(partName:String, instance:Object):void {
			super.partAdded(partName, instance);

			if (instance === toAll) {
				toAll.addEventListener(MouseEvent.CLICK, dispatchToAll, false, 0, true);
			} else if (instance === toSelf) {
				toSelf.addEventListener(MouseEvent.CLICK, dispatchToSelf, false, 0, true);
			} else if (instance === toChildren) {
				toChildren.addEventListener(MouseEvent.CLICK, dispatchToChildren, false, 0, true);
			} else if (instance === toParent) {
				toParent.addEventListener(MouseEvent.CLICK, dispatchToParent, false, 0, true);
			} else if (instance === penetrate) {
				penetrate.selected=true;
			} else if (instance === input) {
				input.text="";
			} else if (instance === changeGlobal) {
				changeGlobal.addEventListener(MouseEvent.CLICK, dispatchChangeGlobal, false, 0, true);
			} else if (instance === changeCurrent) {
				changeCurrent.addEventListener(MouseEvent.CLICK, dispatchChangeCurrent, false, 0, true);
			} else if (instance === createChild) {
				createChild.addEventListener(MouseEvent.CLICK, dispatchCreateChild, false, 0, true);
			} else if (instance === clearMessages) {
				clearMessages.addEventListener(MouseEvent.CLICK, dispatchClearMessages, false, 0, true);
			}

		}

		private function dispatchClearMessages(event:MouseEvent):void {
			dispatchEvent(new Event(CLEAR_MESSAGES));
		}

		private function dispatchCreateChild(event:MouseEvent):void {
			dispatchEvent(new Event(CREATE_CHILD));
		}

		private function dispatchChangeCurrent(event:MouseEvent):void {
			dispatchEvent(new Event(CHANGE_CURRENT));
		}

		private function dispatchChangeGlobal(event:MouseEvent):void {
			dispatchEvent(new Event(CHANGE_GLOBAL));
		}

		private function dispatchToAll(event:MouseEvent):void {
			dispatchEvent(new Event(TO_ALL));
		}

		private function dispatchToSelf(event:MouseEvent):void {
			dispatchEvent(new Event(TO_SELF));
		}

		private function dispatchToParent(event:MouseEvent):void {
			dispatchEvent(new Event(TO_PARENT));
		}

		private function dispatchToChildren(event:MouseEvent):void {
			dispatchEvent(new Event(TO_CHILDREN));
		}

		override protected function partRemoved(partName:String, instance:Object):void {
			super.partRemoved(partName, instance);

			if (instance === toAll) {
				toAll.removeEventListener(MouseEvent.CLICK, dispatchToAll);
			} else if (instance === toSelf) {
				toSelf.removeEventListener(MouseEvent.CLICK, dispatchToSelf);
			} else if (instance === toChildren) {
				toChildren.removeEventListener(MouseEvent.CLICK, dispatchToChildren);
			} else if (instance === toParent) {
				toParent.removeEventListener(MouseEvent.CLICK, dispatchToParent);
			} else if (instance === penetrate) {

			} else if (instance === input) {

			} else if (instance === changeGlobal) {
				changeGlobal.removeEventListener(MouseEvent.CLICK, dispatchChangeGlobal);
			} else if (instance === changeCurrent) {
				changeGlobal.removeEventListener(MouseEvent.CLICK, dispatchChangeCurrent);
			} else if (instance === createChild) {
				createChild.removeEventListener(MouseEvent.CLICK, dispatchCreateChild);
			} else if (instance === clearMessages) {
				clearMessages.removeEventListener(MouseEvent.CLICK, dispatchClearMessages);
			}
		}

	}
}
