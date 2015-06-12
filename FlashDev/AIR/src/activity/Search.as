package activity
{
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.display.Image;
	
	import feathers.controls.Button
	import feathers.controls.Radio;
	import feathers.core.ToggleGroup;
	import feathers.controls.TextInput;
	
	
	public class Search extends Sprite {

		public static const BACK:String = "back";

		public function Search() {
			var label:TextField = new TextField(480, 60, "Поиск по словам", "Segoe Print", 35, 0x00ff00, true);
			label.x=int((EmbeddedAssets.STAGE_WIDTH - label.width) / 2);
            label.y = 5;
            addChild(label);	
			
			var button:Button = new Button();
			button.defaultIcon = new Image(Root.assets.getTexture("button-back-up-skin"));
			button.downIcon = new Image(Root.assets.getTexture("button-back-down-skin"));
			button.x = 20;
			button.y = 10;
			button.addEventListener(Event.TRIGGERED, function():void {
				Root.assets.playSound("click");
				dispatchEventWith(BACK, true);
			});
			addChild(button);
			
			
			label = new TextField(120, 64, "Слово", "Segoe Print", 20);
			label.x = 335;
            label.y = 50;
            addChild(label);
			
			var input1:TextInput = new TextInput();
			input1.x = 255;
			input1.y = 100;
			input1.isEditable = true;
			input1.paddingLeft = 20;
			input1.paddingRight = 20;
			input1.textEditorProperties.fontSize = 20;
			input1.textEditorProperties.fontFamily = "Segoe Print";
			input1.backgroundSkin = new Image(Root.assets.getTexture("input10000"));
			addChild(input1);
			
			
			
			
		}
		
		
		
	}
}
