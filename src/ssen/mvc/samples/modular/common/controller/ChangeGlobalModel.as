package ssen.mvc.samples.modular.common.controller {
	import flash.events.Event;
	
	import ssen.mvc.core.DispatchTo;
	import ssen.mvc.core.ICommand;
	import ssen.mvc.core.IEventBus;
	import ssen.mvc.samples.modular.common.events.ModularEvent;
	import ssen.mvc.samples.modular.common.model.CurrentModel;
	import ssen.mvc.samples.modular.common.model.GlobalModel;

	public class ChangeGlobalModel implements ICommand {
		[Inject]
		public var global:GlobalModel;

		[Inject]
		public var current:CurrentModel;

		[Inject]
		public var eventBus:IEventBus;

		public function execute(event:Event=null):void {
			global.refresh();

			dispatchChangedGlobal(DispatchTo.SELF);
			dispatchChangedGlobal(DispatchTo.CHILDREN);
		}

		private function dispatchChangedGlobal(target:String):void {
			var evt:ModularEvent=new ModularEvent(ModularEvent.CHANGED_GLOBAL_MODEL);
			evt.from=current;
			evt.dispatchTarget=target;

			eventBus.dispatchEvent(evt, target, true);
		}
	}
}
