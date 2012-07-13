package ssen.mvc.samples.modular.third {
	import ssen.mvc.core.IContext;
	import ssen.mvc.core.IContextView;
	import ssen.mvc.ondisplay.Context;
	import ssen.mvc.samples.modular.common.controller.ChangeCurrentModel;
	import ssen.mvc.samples.modular.common.events.ModularEvent;
	import ssen.mvc.samples.modular.common.model.CurrentModel;
	import ssen.mvc.samples.modular.common.view.MessageCatcher;
	import ssen.mvc.samples.modular.common.view.MessageCatcherMediator;
	import ssen.mvc.samples.modular.common.view.MessageSender;
	import ssen.mvc.samples.modular.common.view.MessageSenderMediator;
	import ssen.mvc.samples.modular.third.model.ThirdLevelCurrentModelImpl;

	public class ThirdLevelModuleContext extends Context {
		public function ThirdLevelModuleContext(contextView:IContextView, parentContext:IContext=null) {
			super(contextView, parentContext);
		}

		override protected function mapDependency():void {
			viewInjector.mapView(MessageCatcher, MessageCatcherMediator);
			viewInjector.mapView(MessageSender, MessageSenderMediator);

			injector.mapSingletonOf(CurrentModel, ThirdLevelCurrentModelImpl);

			commandMap.mapCommand(ModularEvent.CHANGE_CURRENT_MODEL, ChangeCurrentModel);
		}
	}
}
