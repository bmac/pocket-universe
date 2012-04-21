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
		private var _mass:int = 1;
		
		[Embed (source = "../assets/planets/grape-planet.png")] private var apple_sprite:Class;

		/** 
		 * if 0, not a checkpoint. 
		 * If 1 to 360 the planet is a checkpoint,
		 * the value is the starting position for player
		 */
		private var _checkpoint:int;
		
		public function Planet(x:int, y:int, checkpoint:int) 
		{
			this._checkpoint = checkpoint;
			super(x, y);
			this.loadGraphic(apple_sprite);
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
			return new FlxPoint( (this.x + this.getSize() / 2), (this.y + this.getSize() / 2 ));
		}
		
		
		//Returns a point at the specified position on this planet
		public function getPointAt(position:int):FlxPoint
		{
			var point:FlxPoint = new FlxPoint();
			
			if ((position < 1) || (position > 360))
			{
				throw new ArgumentError("Position is out of bounds. Must be within 1-360");
			}
			
			// find the center point of the planet
			point = this.getCenter(); 
			// calculate the x and y for the position and store in the point
			point.x = point.x + _size * Math.cos(position * 2 * Math.PI / 360);
			point.y = point.y + _size * Math.sin(position * 2 * Math.PI / 360);
			
			return point;
		}
		
		public function getCheckpoint():int
		{
			return _checkpoint;
		}
		// returns true if the planet is a valid checkpoint planet
		public function isCheckpoint():Boolean
		{
			if ((_checkpoint > 0) && (_checkpoint <= 360))
			{
				return true;
			}
			else return false;
		}
		
		public function playerCollision(player:Player):void
		{
			if (this.isCheckpoint() == true)
			{
				player.reachedCheckpoint(this);
			}
		}
	}
}