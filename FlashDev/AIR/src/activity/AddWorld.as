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
	
	
	public class AddWorld extends Sprite {

		public static const ADD:String = "add";
		public static const BACK:String = "back";

		public function AddWorld() {
			//new MetalWorksMobileTheme();
			var label:TextField = new TextField(480, 60, "Выберите язык", "Segoe Print", 35, 0x00ff00, true);
			label.x=int((EmbeddedAssets.STAGE_WIDTH - label.width) / 2);
            label.y = 5;
            addChild(label);
			
			label = new TextField(120, 64, "Русский", "Segoe Print", 25);
			label.x=200
            label.y = 83;
            addChild(label);
			
			label = new TextField(220, 64, "Португальский", "Segoe Print", 25);
			label.x=490
            label.y = 83;
            addChild(label);
			
			var group:ToggleGroup = new ToggleGroup();
			//group.addEventListener( Event.CHANGE, group_changeHandler );
     
			var radio1:Radio = new Radio();
			radio1.x = 150;
			radio1.y = 100;
			radio1.label = "                                            ";
			radio1.toggleGroup = group;
			radio1.defaultIcon=new Image(Root.assets.getTexture("background-skin"));
			radio1.downIcon = new Image(Root.assets.getTexture("background-down-skin"));
			radio1.disabledIcon = new Image(Root.assets.getTexture("background-disabled-skin"));
			radio1.defaultSelectedIcon=new Image(Root.assets.getTexture("radio-selected-up-icon"));
			radio1.selectedUpIcon = new Image(Root.assets.getTexture("radio-selected-up-icon"));
			radio1.selectedDownIcon = new Image(Root.assets.getTexture("radio-selected-down-icon"));
			radio1.selectedDisabledIcon = new Image(Root.assets.getTexture("radio-selected-disabled-icon"));
			addChild( radio1 );
			 
			var radio2:Radio = new Radio();
			radio2.x = 440;
			radio2.y = 100;
			radio2.label = "                                                                                ";
			radio2.toggleGroup = group;
			radio2.defaultIcon=new Image(Root.assets.getTexture("background-skin"));
			radio2.downIcon = new Image(Root.assets.getTexture("background-down-skin"));
			radio2.disabledIcon = new Image(Root.assets.getTexture("background-disabled-skin"));
			radio2.defaultSelectedIcon=new Image(Root.assets.getTexture("radio-selected-up-icon"));
			radio2.selectedUpIcon = new Image(Root.assets.getTexture("radio-selected-up-icon"));
			radio2.selectedDownIcon = new Image(Root.assets.getTexture("radio-selected-down-icon"));
			radio2.selectedDisabledIcon = new Image(Root.assets.getTexture("radio-selected-disabled-icon"));
			addChild( radio2 );
			
			
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
			label.x = 135;
            label.y = 190;
            addChild(label);
			
			var input1:TextInput = new TextInput();
			input1.x = 55;
			input1.y = 240;
			input1.isEditable = true;
			input1.paddingLeft = 20;
			input1.paddingRight = 20;
			input1.textEditorProperties.fontSize = 20;
			input1.textEditorProperties.fontFamily = "Segoe Print";
			input1.backgroundSkin = new Image(Root.assets.getTexture("input10000"));
			addChild(input1);
			
			label = new TextField(120, 64, "Перевод", "Segoe Print", 20);
			label.x = 535;
            label.y = 190;
            addChild(label);
			
			var input2:TextInput = new TextInput();
			input2.x = 455;
			input2.y = 240;
			input2.isEditable = true;
			input2.paddingLeft = 20;
			input2.paddingRight = 20;
			input2.textEditorProperties.fontSize = 20;
			input2.textEditorProperties.fontFamily = "Segoe Print";
			input2.backgroundSkin = new Image(Root.assets.getTexture("input10000"));
			addChild(input2);
			
			var button2:Button = new Button();
			button2.defaultSkin = new Image(Root.assets.getTexture("button10000"));
			button2.x = 240;
			button2.y = 380;
			button2.addEventListener(Event.TRIGGERED, function():void {
				Root.assets.playSound("click");
				dispatchEventWith(BACK, true);
			});
			addChild(button2);

			label = new TextField(150, 64, "Добавить", "Segoe Print", 25);
			label.x = 330;
            label.y = 385;
			label.touchable = false;
            addChild(label);
			
		}
		
		private function group_changeHandler():void {
			//
		}
		
	}
}
