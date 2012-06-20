package ssen.mvc.samples.modular.common.view {

	import mx.core.UIComponent;
	
	import spark.components.Group;
	import spark.components.supportClasses.SkinnableComponent;

	public class ChildrenGroup extends SkinnableComponent {

		[SkinPart(required="true")]
		public var group:Group;

		public function createChild(child:UIComponent):void {
			if (group !== null) {
				group.addElement(child);
			}
		}
	}
}
