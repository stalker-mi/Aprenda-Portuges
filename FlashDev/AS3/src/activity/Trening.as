package activity
{
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.display.Image;
	import utils.dragSource;
	import utils.dropTarget;
	import utils.Words;
	
	import feathers.controls.Button;
	
import starling.display.Quad;
	
	
	public class Trening extends Sprite {

		public static const ADD:String = "add";
		public static const BACK:String = "back";

		public function Trening() {
			var label:TextField = new TextField(480, 60, "Тренировка", "Segoe Print", 35, 0x00ff00, true);
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

			var arr1:Vector.<String> = new Vector.<String>;
			arr1.push("Amor","Coração","Pegar a onda","Madrugada","Fazer Amor","Querido","Saudade","Pegar");
			
			var arr2:Vector.<String> = new Vector.<String>;
			arr2.push("Любовь","Сердце","Ловить волну", "Рассвет", "Заниматься любовью","Дорогой", "Ностальгия","Добыча");
			
			
			
			shuffleArray(arr1);
			shuffleArray(arr2);
			
				for (var y:int = 0; y < 8; y++ ) {
					var myDragSource:dragSource = new dragSource("myformat", y, arr1[y]);
					addChild(myDragSource);
				}
			for (y = 0; y < 8; y++ ) {
					var myDropTarget:dropTarget = new dropTarget("myformat", y, arr2[y]);
					addChild(myDropTarget);
				}
			
		}
		
		private function shuffleArray(arr:Vector.<String>):void {
			for (var i:int=0; i < arr.length; i++)
				{
					var index:int = int(Math.random() * i);
					var a:String = arr[index];
					arr[index] = arr[i];
					arr[i] = a;
				}
		}
		
		
		
	}
}
