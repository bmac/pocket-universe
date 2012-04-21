package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Vinny
	 */
	public class DareState extends FlxState
	{
		
		private var _score:int;
		
		public function getScore():int 
		{
			return _score;
		}
		public function setScore(score:int):void
		{
			_score = score;
		}
		
	}

}