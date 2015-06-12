package utils 
{
	/**
	 * ...
	 * @author Vovik
	 */
	public class Words 
	{
		public var words:Vector.<Word>;
		
		public function Words(words:Vector.<String>, translates:Vector.<String>) 
		{
			this.words = new Vector.<Word>;
			
			for (var i:int; i < words.length; i++)
				{
					var word:Word = new Word(words[i], translates[i]);
					this.words.push(word);
				}
		}
		
	}

}