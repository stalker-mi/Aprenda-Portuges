package activity
{
	
	import starling.display.Sprite;
	import starling.display.Button;
	import starling.events.Event;
	import starling.text.TextField;

	import feathers.controls.Radio;
	import feathers.core.ToggleGroup;
	
	public class AddWorld extends Sprite {

		 public static const EXIT:String = "exit";


		public function AddWorld() {
			
			var label:TextField = new TextField(480, 60, "Выберите язык", "Verdana", 25, 0x00ff00, true);
			label.x=int((EmbeddedAssets.STAGE_WIDTH - label.width) / 2);
            label.y = 5;
            addChild(label);
			
			var group:ToggleGroup = new ToggleGroup();
			//group.addEventListener( Event.CHANGE, group_changeHandler );
     
			var radio1:Radio = new Radio();
			radio1.x = 50;
			radio1.y = 50;
			radio1.label = "One";
			//radio1.toggleGroup = group;
			addChild( radio1 );
			 
			var radio2:Radio = new Radio();
			radio2.label = "Two";
			//radio2.toggleGroup = group;
			addChild( radio2 );
		}
		
		private function group_changeHandler():void {
			//
		}
		
	}
}
