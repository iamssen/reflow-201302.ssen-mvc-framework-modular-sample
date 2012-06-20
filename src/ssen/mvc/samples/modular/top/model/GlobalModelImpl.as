package ssen.mvc.samples.modular.top.model {
	import mx.formatters.DateFormatter;
	
	import ssen.log.formatToString;
	import ssen.mvc.base.Actor;
	import ssen.mvc.samples.modular.common.model.GlobalModel;

	public class GlobalModelImpl extends Actor implements GlobalModel {
		private var _time:Date;
		private var formatter:DateFormatter;

		public function GlobalModelImpl() {
			formatter=new DateFormatter;
			formatter.formatString="HH:NN:SS";

			refresh();
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
			return formatToString('[GlobalModelImpl time="{0}"]', formatter.format(_time));
		}
	}
}
