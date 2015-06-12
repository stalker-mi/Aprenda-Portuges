package utils 
{
	/**
	 * ...
	 * @author Vovik
	 */
	public class Words 
	{
		public var words:Vector.<Word>;
		
		public function Words() 
		{
			this.words = new Vector.<Word>;
		}
		
		public function AddArr(words:Vector.<String>, translates:Vector.<String>):void
		{
			for (var i:int=0; i < words.length; i++)
				{
					var word:Word = new Word(words[i], translates[i]);
					word.date = new Date();
					word.autor = "Ксюша Ле";
					this.words.push(word);
				}
		}
		
		public function Add(word:Word):void {
			word.date = new Date();
			word.autor = "Ксюша Ле";
			this.words.push(word);
		}
		
		public function searchWord(translate:String):Vector.<String> {
			var words:Vector.<String> = new Vector.<String>;
			
			for (var i:int=0; i < this.words.length; i++)
				{
					if (translate == this.words[i].translate)
					words.push(this.words[i].word);
				}
			return words;
		}
		
		public function searchTranslate(word:String):Vector.<String> {
			var translates:Vector.<String> = new Vector.<String>;
			
			for (var i:int=0; i < this.words.length; i++)
				{
					if (word == this.words[i].word)
					translates.push(this.words[i].translate);
				}
			return translates;
		}
		
		public function len():int {
			return this.words.length;
		}
		
		public function get allWords():Vector.<String> {
			var data:Vector.<String>=new Vector.<String>;
			for (var i:int=0; i < words.length; i++)
				{
					data.push(words[i].word);
				}
			return data;
		}
		
		public function get allTranslates():Vector.<String> {
			var data:Vector.<String>=new Vector.<String>;
			for (var i:int=0; i < words.length; i++)
				{
					data.push(words[i].translate);
				}
			return data;
		}
		
		public function get allDates():Vector.<String> {
			var data:Vector.<String>=new Vector.<String>;
			for (var i:int=0; i < words.length; i++)
				{
					data.push(words[i].date);
				}
			return data;
		}
		
		public function get allAutors():Vector.<String> {
			var data:Vector.<String>=new Vector.<String>;
			for (var i:int=0; i < words.length; i++)
				{
					data.push(words[i].autor);
				}
			return data;
		}
		
		
		
	}

}