package activity
{
	
	import feathers.controls.AutoComplete;
	import feathers.controls.List;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextEditor;
	import feathers.core.ITextRenderer;
	import feathers.data.ListCollection;
	import feathers.data.LocalAutoCompleteSource;
	import flash.text.engine.ElementFormat;
	import flash.text.TextFormat;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.display.Image;
	
	import feathers.controls.Button;
	
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
			
			/*
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
			*/
			
			var input:AutoComplete = new AutoComplete();
			
			input.promptFactory = function():ITextRenderer {
				var messageRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				messageRenderer.textFormat = new TextFormat( "Segoe Print", 20, 0x333333 );
				return messageRenderer;
			}
			input.minimumAutoCompleteLength = 1;
			input.textEditorProperties.fontFamily = "Segoe Print";
			input.prompt = "Введите слово";
			input.x = 255;
			input.y = 100;
			input.isEditable = true;
			input.textEditorProperties.fontSize = 20;
			input.backgroundEnabledSkin=new Image(Root.assets.getTexture("input10000"));
			 input.backgroundFocusedSkin=new Image(Root.assets.getTexture("input10000"));
			input.listFactory = function():List
			{
				 var popUpList:List = new List();
				 var backgroundSkin:Quad = new Quad(88, 88, 0xdddddd);
				 popUpList.backgroundSkin = backgroundSkin;
				 popUpList.itemRendererFactory=function():IListItemRenderer
				{
					var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
					renderer.labelFactory= function():ITextRenderer
					 {
						var messageRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
						messageRenderer.textFormat = new TextFormat( "Segoe Print", 14, 0x333333 );
						return messageRenderer;
					 }
					renderer.padding = 11;
					return renderer;
				};
				
             return popUpList;
			};
			var source:Vector.<String> = new Vector.<String>;
			source=Root.words.allWords.concat(Root.words.allTranslates);
			input.source = new LocalAutoCompleteSource(new ListCollection(source));
			input.addEventListener(Event.CLOSE, function(e:Event):void {
				var t:Vector.<String>;
				var myInput:AutoComplete = e.target as AutoComplete;
				if (Root.words.searchWord(myInput.text).toString())
					t = Root.words.searchWord(myInput.text);
				else
					t = Root.words.searchTranslate(myInput.text);
				label_tr.visible = true;
				label_tr.text = t.join();
			});
			addChild(input);
			
			var label_tr:TextField = new TextField(420, 64, "", "Segoe Print", 20);
			label_tr.x=int((EmbeddedAssets.STAGE_WIDTH - label_tr.width) / 2);
			label_tr.y = 200;
			label_tr.visible = false;
			addChild(label_tr);
			
		}
		
		
	}
}
