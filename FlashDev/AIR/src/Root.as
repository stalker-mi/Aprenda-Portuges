package 
{
    import starling.display.Sprite;
    import starling.utils.AssetManager;
	import starling.events.Event;
	import starling.display.Image;
	
	import activity.*;
	
    public class Root extends Sprite
    {
		private static var sAssets:AssetManager;
        private var mActiveScene:Sprite;
		
        public function Root()
        {
            addEventListener(Menu.ADD_WORLD,  nextFrame);
			addEventListener(Menu.TRENING,  nextFrame);
			addEventListener(Menu.SEARCH,  nextFrame);
			addEventListener(AddWorld.BACK,  nextFrame);
			addEventListener(Search.BACK,  nextFrame);
        }
		
		 public function start(assets:AssetManager):void
        {
            sAssets = assets;
			addChild(new Image(assets.getTexture("background")));
			showScene(Menu);
        }
		
		private function nextFrame(event:Event):void
        {
			switch(event.type) {
				case Menu.ADD_WORLD:
					showScene(AddWorld);
					break;
				case Menu.TRENING:
					showScene(Trening);
					break;	
				case Menu.SEARCH:
					showScene(Search);
					break;
				case "back":
					showScene(Menu);
					break;
				
					
				
			}
            
        }
		
		private function showScene(screen:Class):void
        {
            if (mActiveScene) mActiveScene.removeFromParent(true);
            mActiveScene = new screen();
            addChild(mActiveScene);
        }
		
		public static function get assets():AssetManager { return sAssets; }
		
    }
}