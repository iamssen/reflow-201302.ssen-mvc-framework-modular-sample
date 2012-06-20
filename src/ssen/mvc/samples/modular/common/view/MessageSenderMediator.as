package ssen.mvc.samples.modular.common.view {
	import flash.events.Event;

	import ssen.mvc.base.DispatchTarget;
	import ssen.mvc.core.IContextDispatcher;
	import ssen.mvc.core.IMediator;
	import ssen.mvc.samples.modular.common.events.ModularEvent;
	import ssen.mvc.samples.modular.common.model.CurrentModel;

	public class MessageSenderMediator implements IMediator {
		[Inject]
		public var dispatcher:IContextDispatcher;

		[Inject]
		public var current:CurrentModel;

		private var view:MessageSender;

		public function setView(view:Object):void {
			this.view=view as MessageSender;
		}

		public function onRegister():void {
			view.addEventListener(view.TO_ALL, toAll, false, 0, true);
			view.addEventListener(view.TO_PARENT, toParent, false, 0, true);
			view.addEventListener(view.TO_CHILDREN, toChildren, false, 0, true);
			view.addEventListener(view.TO_SELF, toSelf, false, 0, true);
			view.addEventListener(view.CHANGE_CURRENT, changeCurrent, false, 0, true);
			view.addEventListener(view.CHANGE_GLOBAL, changeGlobal, false, 0, true);
			view.addEventListener(view.CREATE_CHILD, createChild, false, 0, true);
		}

		private function createChild(event:Event):void {
			dispatcher.dispatch(new ModularEvent(ModularEvent.CREATE_CHILD));
		}

		private function toMessage(target:String):void {
			var evt:ModularEvent=new ModularEvent(ModularEvent.SEND_MESSAGE);
			evt.message=view.getText();
			evt.from=current;
			evt.dispatchTarget=target;

			dispatcher.dispatch(evt, target, view.getPenetrate());
		}

		private function changeGlobal(event:Event):void {
			var target:String=(current.getLevel() > 1) ? DispatchTarget.PARENT : DispatchTarget.SELF;

			var evt:ModularEvent=new ModularEvent(ModularEvent.CHANGE_GLOBAL_MODEL);
			evt.from=current;
			evt.dispatchTarget=target;

			dispatcher.dispatch(evt, target, true);
		}

		private function changeCurrent(event:Event):void {
			var evt:ModularEvent=new ModularEvent(ModularEvent.CHANGE_CURRENT_MODEL);
			evt.from=current;

			dispatcher.dispatch(evt);
		}

		private function toSelf(event:Event):void {
			toMessage(DispatchTarget.SELF);
		}

		private function toChildren(event:Event):void {
			toMessage(DispatchTarget.CHILDREN);
		}

		private function toParent(event:Event):void {
			toMessage(DispatchTarget.PARENT);
		}

		private function toAll(event:Event):void {
			toMessage(DispatchTarget.ALL);
		}

		public function onRemove():void {
			view.removeEventListener(view.TO_ALL, toAll);
			view.removeEventListener(view.TO_PARENT, toParent);
			view.removeEventListener(view.TO_CHILDREN, toChildren);
			view.removeEventListener(view.TO_SELF, toSelf);
			view.removeEventListener(view.CHANGE_CURRENT, changeCurrent);
			view.removeEventListener(view.CHANGE_GLOBAL, changeGlobal);
			view.removeEventListener(view.CREATE_CHILD, createChild);
		}
	}
}
