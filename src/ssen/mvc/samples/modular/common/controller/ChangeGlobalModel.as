package ssen.mvc.samples.modular.common.controller {
	import flash.events.Event;
	
	import ssen.mvc.base.DispatchTarget;
	import ssen.mvc.core.ICommand;
	import ssen.mvc.core.IContextDispatcher;
	import ssen.mvc.samples.modular.common.events.ModularEvent;
	import ssen.mvc.samples.modular.common.model.CurrentModel;
	import ssen.mvc.samples.modular.common.model.GlobalModel;

	public class ChangeGlobalModel implements ICommand {
		[Inject]
		public var global:GlobalModel;

		[Inject]
		public var current:CurrentModel;

		[Inject]
		public var dispatcher:IContextDispatcher;

		public function execute(event:Event=null):void {
			global.refresh();

			dispatchChangedGlobal(DispatchTarget.SELF);
			dispatchChangedGlobal(DispatchTarget.CHILDREN);
		}

		private function dispatchChangedGlobal(target:String):void {
			var evt:ModularEvent=new ModularEvent(ModularEvent.CHANGED_GLOBAL_MODEL);
			evt.from=current;
			evt.dispatchTarget=target;

			dispatcher.dispatch(evt, target, true);
		}
	}
}
