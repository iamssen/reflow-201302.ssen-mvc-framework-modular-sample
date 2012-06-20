package ssen.mvc.samples.modular.common.controller {
	import flash.events.Event;
	
	import ssen.mvc.base.DispatchTarget;
	import ssen.mvc.core.ICommand;
	import ssen.mvc.core.IContextDispatcher;
	import ssen.mvc.samples.modular.common.events.ModularEvent;
	import ssen.mvc.samples.modular.common.model.CurrentModel;

	public class ChangeCurrentModel implements ICommand {
		[Inject]
		public var current:CurrentModel;

		[Inject]
		public var dispatcher:IContextDispatcher;

		public function execute(event:Event=null):void {
			current.refresh();

			var evt:ModularEvent=new ModularEvent(ModularEvent.CHANGED_CURRENT_MODEL);
			evt.from=current;
			evt.dispatchTarget=DispatchTarget.SELF;

			dispatcher.dispatch(evt);
		}
	}
}
