package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author 
	 */
	public class PlanetBackground extends FlxSprite 
	{
		
		public function PlanetBackground(x:int, y:int, imageResource:Class, scale:Number=1) 
		{
			super(x, y);
			this.loadGraphic(imageResource);
			this.scale = new FlxPoint(scale, scale);

		}
		
	}

}