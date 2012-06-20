package ssen.mvc.samples.modular.common.events {
	import flash.events.Event;
	
	import ssen.mvc.samples.modular.common.model.CurrentModel;

	public class ModularEvent extends Event {

		public static const SEND_MESSAGE:String="sendMessage";
		public static const CHANGE_GLOBAL_MODEL:String="changeGlobalModel";
		public static const CHANGED_GLOBAL_MODEL:String="changedGlobalModel";
		public static const CHANGE_CURRENT_MODEL:String="changeCurrentModel";
		public static const CHANGED_CURRENT_MODEL:String="changedCurrentModel";
		public static const CREATE_CHILD:String="createChild";

		public var from:CurrentModel;
		public var dispatchTarget:String;
		public var message:String;

		public function ModularEvent(type:String) {
			super(type);
		}

		override public function clone():Event {
			var evt:ModularEvent=new ModularEvent(type);
			evt.from=from;
			evt.dispatchTarget=dispatchTarget;

			return evt;
		}

		override public function toString():String {
			return formatToString("ModularEvent", "type", "message", "from", "dispatchTarget");
		}
	}
}
