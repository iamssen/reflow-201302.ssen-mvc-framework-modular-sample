package ssen.mvc.samples.modular.common.view {
	import ssen.mvc.core.IContextDispatcher;
	import ssen.mvc.core.IMediator;
	import ssen.mvc.samples.modular.common.events.ModularEvent;
	import ssen.mvc.samples.modular.common.model.CurrentModel;
	import ssen.mvc.samples.modular.common.model.GlobalModel;

	public class MessageCatcherMediator implements IMediator {
		[Inject]
		public var dispatcher:IContextDispatcher;

		[Inject]
		public var global:GlobalModel;

		[Inject]
		public var current:CurrentModel;

		private var view:MessageCatcher;

		public function setView(view:Object):void {
			this.view=view as MessageCatcher;
		}

		public function onRegister():void {
			dispatcher.addEventListener(ModularEvent.CLEAR_MESSAGES, clearMessages);
			dispatcher.addEventListener(ModularEvent.SEND_MESSAGE, receiveMessage);
			dispatcher.addEventListener(ModularEvent.CHANGED_GLOBAL_MODEL, refreshModelData);
			dispatcher.addEventListener(ModularEvent.CHANGED_CURRENT_MODEL, refreshModelData);

			appendText("Message Catcher Registered");
			appendText("\n=================================");

			printModelData();
		}

		private function clearMessages(event:ModularEvent):void {
			view.text="";
		}

		public function onRemove():void {
			dispatcher.removeEventListener(ModularEvent.CLEAR_MESSAGES, clearMessages);
			dispatcher.removeEventListener(ModularEvent.SEND_MESSAGE, receiveMessage);
			dispatcher.removeEventListener(ModularEvent.CHANGED_GLOBAL_MODEL, refreshModelData);
			dispatcher.removeEventListener(ModularEvent.CHANGED_CURRENT_MODEL, refreshModelData);
			view=null;
		}

		private function refreshModelData(event:ModularEvent):void {
			appendText("\n=================================");
			appendText("\n" + event.toString());
			printModelData();
		}

		private function printModelData():void {
			var msgs:Vector.<String>=new Vector.<String>;
			msgs.push(">> " + global);
			msgs.push(">> " + current);
			msgs.push("--------------------------------------------------------");

			appendText("\n" + msgs.join("\n"));
		}

		private function receiveMessage(event:ModularEvent):void {
			appendText("\n" + event.toString());
		}

		private function appendText(str:String):void {
			if (view.textDisplay) {
				view.appendText(str);
			} else {
				view.text=view.text + str;
			}
		}
	}
}
