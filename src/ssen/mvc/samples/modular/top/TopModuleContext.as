package ssen.mvc.samples.modular.top {
	import ssen.mvc.core.IContext;
	import ssen.mvc.core.IContextView;
	import ssen.mvc.ondisplay.DisplayContext;
	import ssen.mvc.samples.modular.common.controller.ChangeCurrentModel;
	import ssen.mvc.samples.modular.common.controller.ChangeGlobalModel;
	import ssen.mvc.samples.modular.common.events.ModularEvent;
	import ssen.mvc.samples.modular.common.model.CurrentModel;
	import ssen.mvc.samples.modular.common.model.GlobalModel;
	import ssen.mvc.samples.modular.common.view.ChildrenGroup;
	import ssen.mvc.samples.modular.common.view.MessageCatcher;
	import ssen.mvc.samples.modular.common.view.MessageCatcherMediator;
	import ssen.mvc.samples.modular.common.view.MessageSender;
	import ssen.mvc.samples.modular.common.view.MessageSenderMediator;
	import ssen.mvc.samples.modular.top.model.CurrentModelTopImpl;
	import ssen.mvc.samples.modular.top.model.GlobalModelImpl;
	import ssen.mvc.samples.modular.top.view.TopChildrenGroupMediator;

	public class TopModuleContext extends DisplayContext {
		public function TopModuleContext(contextView:IContextView, parentContext:IContext=null) {
			super(contextView, parentContext);
		}

		override protected function mapDependency():void {
			viewInjector.mapView(MessageCatcher, MessageCatcherMediator);
			viewInjector.mapView(MessageSender, MessageSenderMediator);
			viewInjector.mapView(ChildrenGroup, TopChildrenGroupMediator);

			injector.mapSingletonOf(GlobalModel, GlobalModelImpl);
			injector.mapSingletonOf(CurrentModel, CurrentModelTopImpl);

			commandMap.mapCommand(ModularEvent.CHANGE_GLOBAL_MODEL, ChangeGlobalModel);
			commandMap.mapCommand(ModularEvent.CHANGE_CURRENT_MODEL, ChangeCurrentModel);
		}
	}
}
