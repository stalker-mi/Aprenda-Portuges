package activity
{
	import feathers.text.BitmapFontTextFormat;
    import starling.display.Button;
    import starling.display.Sprite;
    import starling.events.Event;
    import starling.text.TextField;
	import starling.core.Starling;
	import starling.animation.Transitions;
    import starling.animation.Tween;
    import starling.filters.BlurFilter;
	import utils.Synh;

	
	
    /** The Menu shows the logo of the game and a start button that will, once triggered, 
     *  start the actual game. In a real game, it will probably contain several buttons and
     *  link to several screens (e.g. a settings screen or the credits). If your menu contains
     *  a lot of logic, you could use the "Feathers" library to make your life easier. */
    public class Menu extends Sprite
    {
        public static const ADD_WORLD:String = "add";
        public static const TRENING:String = "trening";
		public static const SEARCH:String = "search";
		
        public function Menu()
        {
            init();
        }
        
        private function init():void
        {
			var label:TextField = new TextField(700, 80, "Aprenda Português com paixão", "Segoe Print", 40, 0xff0000, true);
			label.x=int((EmbeddedAssets.STAGE_WIDTH - label.width) / 2);
            label.y = 20;
			label.filter = BlurFilter.createGlow(0xffff00,1,3,0.5);
            addChild(label);
			var tween1:Tween = new Tween(label, 5.0, Transitions.LINEAR);
			tween1.scaleTo(0.95);
			tween1.moveTo(label.x + 20, label.y);
			var tween2:Tween=new Tween(label, 5.0, Transitions.LINEAR);
			tween2.scaleTo(1);
			tween2.moveTo(label.x, label.y);
			Starling.juggler.add(tween1);
			tween1.onComplete = function():void {	
				Starling.juggler.remove(tween1);
				Starling.juggler.add(tween2);
			}
			tween2.onComplete = function():void {	
				Starling.juggler.remove(tween2);
			}
            var button:Button = new Button(Root.assets.getTexture("button10000"), "Пополнить словарный запас");
			button.fontName = "Segoe Print";
			button.fontSize = 20;
            button.x = 50;
            button.y = 150;
            button.addEventListener(Event.TRIGGERED, function():void {
				Root.assets.playSound("click");
				dispatchEventWith(ADD_WORLD, true);
			});
            addChild(button);
			

			var button2:Button = new Button(Root.assets.getTexture("button10000"), "Тренировка");
			button2.fontName = "Segoe Print";
			button2.fontSize = 20;
            button2.x = 430;
            button2.y = 150;
            button2.addEventListener(Event.TRIGGERED, function():void {
				Root.assets.playSound("click");
				dispatchEventWith(TRENING, true);
			});
            addChild(button2);
			if(Root.words.len()<8) button2.enabled = false;
			
			var button3:Button = new Button(Root.assets.getTexture("button10000"), "Поиск");
			button3.fontName = "Segoe Print";
			button3.fontSize = 20;
            button3.x = int((EmbeddedAssets.STAGE_WIDTH - button3.width) / 2);
            button3.y = 320;
            button3.addEventListener(Event.TRIGGERED, function():void {
				Root.assets.playSound("click");
				dispatchEventWith(SEARCH, true);
			});
            addChild(button3);
			if(Root.words.len()<1) button3.enabled = false;
			
			var button4:Button = new Button(Root.assets.getTexture("synh"));
            button4.x = 680;
            button4.y = 360;
            button4.addEventListener(Event.TRIGGERED, function():void {
				Root.assets.playSound("click");
				var synh:Synh = new Synh();
			});
            addChild(button4);
			
			
        }
        

		
    }
}