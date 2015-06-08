package activity
{
    import starling.display.Button;
    import starling.display.Sprite;
    import starling.events.Event;
    import starling.text.TextField;
	
	import starling.core.Starling;
	import starling.animation.Transitions;
    import starling.animation.Tween;
    import starling.filters.BlurFilter;
	
	import feathers.controls.TextInput;
    /** The Menu shows the logo of the game and a start button that will, once triggered, 
     *  start the actual game. In a real game, it will probably contain several buttons and
     *  link to several screens (e.g. a settings screen or the credits). If your menu contains
     *  a lot of logic, you could use the "Feathers" library to make your life easier. */
    public class Menu extends Sprite
    {
        public static const ADD_WORLD:String = "add";
        public static const TRENING:String = "trening";
		
        public function Menu()
        {
            init();
        }
        
        private function init():void
        {
			var label:TextField = new TextField(480, 60, "Aprenda Portuges com paixao", "Verdana", 25, 0xff0000, true);
			label.x=int((EmbeddedAssets.STAGE_WIDTH - label.width) / 2);
            label.y = 20;
			label.filter = BlurFilter.createGlow(0xffff00,1,3,0.5);
            addChild(label);
			
			var tween1:Tween = new Tween(label, 5.0, Transitions.LINEAR);
			tween1.scaleTo(0.95);
			tween1.moveTo(label.x + 10, label.y);
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
            var button:Button = new Button(Root.assets.getTexture("button_square"), "Пополнить словарный запас");
			button.fontSize = 12;
            button.x = 50;
            button.y = 100;
            button.addEventListener(Event.TRIGGERED, function():void {
				Root.assets.playSound("click");
				dispatchEventWith(ADD_WORLD, true);
			});
            addChild(button);
			
			
			
		
			
			var button2:Button = new Button(Root.assets.getTexture("button_square"), "Тренировка");
			button2.fontSize = 12;
            button2.x = 350;
            button2.y = 100;
            button2.addEventListener(Event.TRIGGERED, function():void {
				Root.assets.playSound("click");
				dispatchEventWith(TRENING, true);
			});
            addChild(button2);
			
			
        }
        

		
    }
}