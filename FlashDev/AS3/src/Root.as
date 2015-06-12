package 
{
    import starling.display.Sprite;
    import starling.utils.AssetManager;
	import starling.events.Event;
	import starling.display.Image;
	import utils.Word;
	import utils.Words;
	
	import activity.*;
	
    public class Root extends Sprite
    {
		private static var sAssets:AssetManager;
		private static var _words:Words;
        private var mActiveScene:Sprite;
		
        public function Root()
        {
            addEventListener(Menu.ADD_WORLD,  nextFrame);
			addEventListener(Menu.TRENING,  nextFrame);
			addEventListener(Menu.SEARCH,  nextFrame);
			addEventListener(AddWord.BACK,  nextFrame);
			addEventListener(AddWord.ADD,  addWord);
			addEventListener(Search.BACK,  nextFrame);
        }
		
		 public function start(assets:AssetManager):void
        {
            sAssets = assets;
			addChild(new Image(assets.getTexture("background")));
			_words = new Words();
			
			var arr1:Vector.<String> = new Vector.<String>;
			arr1.push("Amor","Coração","Pegar a onda","Madrugada","Fazer Amor","Querido","Saudade","Pegar");
			var arr2:Vector.<String> = new Vector.<String>;
			arr2.push("Любовь","Сердце","Ловить волну", "Рассвет", "Заниматься любовью","Дорогой", "Ностальгия","Добыча");
			_words.AddArr(arr1, arr2);
			
			
			showScene(Menu);
        }
		
		private function nextFrame(event:Event):void
        {
			switch(event.type) {
				case Menu.ADD_WORLD:
					showScene(AddWord);
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
		
		private function addWord(event:Event):void
        {
			showScene(Menu);
		}
		
		
		private function showScene(screen:Class):void
        {
            if (mActiveScene) mActiveScene.removeFromParent(true);
            mActiveScene = new screen();
            addChild(mActiveScene);
        }
		
		public static function get assets():AssetManager { return sAssets; }
		
		public static function get words():Words { return _words; }
		
    }
}