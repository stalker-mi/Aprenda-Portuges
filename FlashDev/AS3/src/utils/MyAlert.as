package utils
{
	import feathers.display.Scale9Image;
	import feathers.textures.Scale9Textures;
	import feathers.controls.Alert;
	import feathers.data.ListCollection;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import feathers.core.IFeathersControl;
	import feathers.controls.Header;
	import feathers.controls.ButtonGroup;
	import feathers.controls.Button;
	import flash.text.TextFormat;
	import starling.display.Image;
	
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Vovik
	 */
	public class MyAlert 
	{
		public function MyAlert(message:String) {
			var list:ListCollection=new ListCollection([{ label: "OK" }]);
				var alert:Alert = Alert.show(message, "Sincronização", list);
				var textures:Scale9Textures = new Scale9Textures(Root.assets.getTexture("background-skin"), new Rectangle(5, 5, 22, 22));
				alert.backgroundSkin = new Scale9Image(textures);
				alert.width = 400;
				alert.height = 300;
				alert.alpha = 0.8;
				alert.padding = 20;
				alert.messageFactory = function():ITextRenderer
				{
					 var messageRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
					 messageRenderer.textFormat = new TextFormat( "Segoe Print", 16, 0xffffff );
					 messageRenderer.wordWrap = true;
					 return messageRenderer;
				}
				alert.headerFactory = function():IFeathersControl
				{
					var header:Header = new Header();
					header.titleFactory= function():ITextRenderer
					{
							 var messageRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
							 messageRenderer.textFormat = new TextFormat( "Segoe Print", 20, 0xffffff );
							 return messageRenderer;
					}
					return header;
				};
				alert.buttonGroupFactory = function():ButtonGroup
				{
					var bg:ButtonGroup = new ButtonGroup();
					bg.buttonFactory=function():Button
					{
						 var button:Button = new Button();
						 button.defaultSkin = new Image( Root.assets.getTexture("button-up-skin") );
						 return button;
					};
					 return bg;
				};
		}
	}
	
}