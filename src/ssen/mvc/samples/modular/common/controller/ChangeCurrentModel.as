package ssen.mvc.samples.modular.common.controller {
	import flash.events.Event;
	
	import ssen.mvc.core.DispatchTo;
	import ssen.mvc.core.ICommand;
	import ssen.mvc.core.IEventBus;
	import ssen.mvc.samples.modular.common.events.ModularEvent;
	import ssen.mvc.samples.modular.common.model.CurrentModel;

	public class ChangeCurrentModel implements ICommand {
		[Inject]
		public var current:CurrentModel;

		[Inject]
		public var eventBus:IEventBus;

		public function execute(event:Event=null):void {
			current.refresh();

			var evt:ModularEvent=new ModularEvent(ModularEvent.CHANGED_CURRENT_MODEL);
			evt.from=current;
			evt.dispatchTarget=DispatchTo.SELF;

			eventBus.dispatchEvent(evt);
		}
	}
}
