package ssen.mvc.samples.modular.top.model {
	import mx.formatters.DateFormatter;
	
	import ssen.log.formatToString;
	import ssen.mvc.base.Actor;
	import ssen.mvc.samples.modular.common.model.CurrentModel;

	public class TopCurrentModelImpl extends Actor implements CurrentModel {
		private var _time:Date;
		private var formatter:DateFormatter;

		public function TopCurrentModelImpl() {
			formatter=new DateFormatter;
			formatter.formatString="HH:NN:SS";

			refresh();
		}

		public function getLevel():int {
			return 1;
		}

		public function getTime():Date {
			return _time;
		}

		public function refresh():void {
			_time=new Date;
		}

		override protected function destruct():void {
			super.destruct();
			_time=null;
		}

		public function toString():String {
			return formatToString('[TopCurrentModelImpl level="{0}" time="{1}"]', getLevel(),
								  formatter.format(_time));
		}
	}
}
