package ssen.mvc.samples.modular.second {
	import ssen.mvc.core.IContext;
	import ssen.mvc.core.IContextView;
	import ssen.mvc.ondisplay.DisplayContext;
	import ssen.mvc.samples.modular.common.controller.ChangeCurrentModel;
	import ssen.mvc.samples.modular.common.events.ModularEvent;
	import ssen.mvc.samples.modular.common.model.CurrentModel;
	import ssen.mvc.samples.modular.common.view.ChildrenGroup;
	import ssen.mvc.samples.modular.common.view.MessageCatcher;
	import ssen.mvc.samples.modular.common.view.MessageCatcherMediator;
	import ssen.mvc.samples.modular.common.view.MessageSender;
	import ssen.mvc.samples.modular.common.view.MessageSenderMediator;
	import ssen.mvc.samples.modular.second.model.SecondLevelCurrentModelImpl;
	import ssen.mvc.samples.modular.second.view.SecondLevelChildrenGroupMediator;

	public class SecondLevelModuleContext extends DisplayContext {
		public function SecondLevelModuleContext(contextView:IContextView, parentContext:IContext=null) {
			super(contextView, parentContext);
		}

		override protected function mapDependency():void {
			viewInjector.mapView(MessageCatcher, MessageCatcherMediator);
			viewInjector.mapView(MessageSender, MessageSenderMediator);
			viewInjector.mapView(ChildrenGroup, SecondLevelChildrenGroupMediator);

			injector.mapSingletonOf(CurrentModel, SecondLevelCurrentModelImpl);

			commandMap.mapCommand(ModularEvent.CHANGE_CURRENT_MODEL, ChangeCurrentModel);
		}
	}
}
