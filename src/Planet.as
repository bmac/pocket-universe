package  
{
	import flash.geom.Point;
	import org.flixel.*;
	/**
	 * ...
	 * @author Vinny
	 */
	public class Planet extends FlxSprite
	{
		private var _size:int;
		private var _mass:int;
		
		public function Planet(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
		}
		
		//The Rectangular Size of this planet (ie the texture size)
		public function getSize():int 
		{
			return _size;
		}
		public function setSize(size:int):void
		{
			_size = size;
		}
		
		//Returns the center of this Circle
		public function getCenter():FlxPoint 
		{
			return new FlxPoint( (this.getSize() / 2), (this.getSize() / 2 ));
		}
		
		/*
		//Returns a point at the specified position on this planet
		public function getPointAt(position:int):FlxPoint
		{
			if (position < 0 || position > 360)
			{
				throw new ArgumentError("Position is out of bounds. Must be within 0-360)");
			}
			
			
		}
		*/
	}
}