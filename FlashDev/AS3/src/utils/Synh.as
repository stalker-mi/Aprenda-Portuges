package utils 
{
	//import flash.events.Event;
	import starling.events.Event;
		
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.IOErrorEvent;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;
	import flash.net.URLLoaderDataFormat;
	/**
	 * ...
	 * @author Vovik
	 */
	public class Synh 
	{
		public var message:String;
		
		public function Synh() 
		{
			var words:Vector.<String> = Root.words.allWords;
			var translates:Vector.<String> = Root.words.allTranslates;
			var dates:Vector.<String> = Root.words.allDates;
			var autors:Vector.<String> = Root.words.allAutors;
			
			var url:URLRequest = new URLRequest("http://in-syst.ru/AprendaPortuges/add.php");
			var variables:URLVariables = new URLVariables();
			variables.words = words;
			variables.translates = translates;
			variables.dates = dates;
			variables.autors = autors;
			url.data = variables;
			url.method=URLRequestMethod.POST;
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
			urlLoader.load(url);
			message = "I just wanted you to know that I have a very important message to share with you.";
			urlLoader.addEventListener(Event.COMPLETE, function():void {
				message = urlLoader.data as String;
				var my_alert:MyAlert = new MyAlert(message);
			});
			
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, function():void {
				message = "Ошибка синхронизации. Проверьте соединение с интернетом";
				var my_alert:MyAlert = new MyAlert(message);
			});
		}
		
	}

}