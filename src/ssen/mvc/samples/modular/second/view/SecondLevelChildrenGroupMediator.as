package ssen.mvc.samples.modular.second.view {
	import ssen.mvc.core.IEventBus;
	import ssen.mvc.core.IMediator;
	import ssen.mvc.samples.modular.common.events.ModularEvent;
	import ssen.mvc.samples.modular.common.view.ChildrenGroup;
	import ssen.mvc.samples.modular.third.ThirdLevelModule;

	public class SecondLevelChildrenGroupMediator implements IMediator {
		[Inject]
		public var eventBus:IEventBus;

		private var view:ChildrenGroup;

		public function setView(view:Object):void {
			this.view=view as ChildrenGroup;
		}

		public function onRegister():void {
			eventBus.addEventListener(ModularEvent.CREATE_CHILD, createChild);
		}

		private function createChild(event:ModularEvent):void {
			var child:ThirdLevelModule=new ThirdLevelModule;
			child.percentWidth=90;
			view.createChild(child);
		}

		public function onRemove():void {
			eventBus.removeEventListener(ModularEvent.CREATE_CHILD, createChild);
		}
	}
}
