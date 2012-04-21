package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author 
	 */
	public class PlanetBackground extends FlxSprite 
	{
		
		public function PlanetBackground(x:int, y:int, imageResource:Class) 
		{
			super(x, y);
			this.loadGraphic(imageResource);
		}
		
	}

}