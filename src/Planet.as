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
		protected var planetMass:int = 1;
		
		[Embed (source = "../assets/planets/grape-planet.png")] private var apple_sprite:Class;

		/** 
		 * if 0, not a checkpoint. 
		 * If 1 to 360 the planet is a checkpoint,
		 * the value is the starting position for player
		 */
		protected var checkpoint:int;
		
		public function Planet(x:int, y:int, checkpoint:int, size:int) 
		{
			this.checkpoint = checkpoint;
			super(x, y);
			_size = size;
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
		
		public function getRadius():Number
		{
			return this.getSize() / 2;
		}
		
		public function getMass():int
		{
			return planetMass;
		}
		
		//Returns the center of this Circle in the world
		public function getCenter():FlxPoint 
		{
			return new FlxPoint(this.origin.x + this.x, this.origin.y + this.y);
		}
		
		
		//Returns a point at the specified position on this planet
		public function getPointAt(angle:int, adjustHeight:int = 0):FlxPoint
		{
			
			if ((angle < 1) || (angle > 360))
			{
				throw new ArgumentError("Position is out of bounds. Must be within 1-360");
			}
			
			var point:FlxPoint = new FlxPoint();
			
			var centerX:int = this.getCenter().x;
			var centerY:int = this.getCenter().y;
			var radius:Number = this.getRadius() + adjustHeight;
			
			var newAngle:int = angle - 90; //This is done so that 0 is at the top of the planets
			
			point.x = centerX + radius * Math.cos(newAngle * Math.PI /180);
			point.y = centerY + radius * Math.sin(newAngle * Math.PI /180);
			
			return point;
		}
		
		//TODO: If we need to place obstacles, we need an abstract class
		public function PlaceOnPlanet(gameObject:Player):void 
		{
			
			//Height adjustment to make the object appear ontop of the planet... also adjusts for any gaps on the sprite
			var heightAdjustment:int = (gameObject.height / 2) - 8;
			
			//newPosition is relative to the planet's origin
			var newPosition: FlxPoint = this.getPointAt(gameObject.getLocationOnPlanet(), heightAdjustment); 
			
			
			//This should adjust the position of the object based on it's size
			newPosition.x = newPosition.x - (gameObject.width / 2);
			newPosition.y = newPosition.y - (gameObject.height / 2);
			
			gameObject.x = newPosition.x;
			gameObject.y = newPosition.y;
			
			gameObject.angle = gameObject.getLocationOnPlanet();
			
			//Uncoment the line below to have the planet rotate in the opposite direction
			//this.angle = -1 * gameObject.getLocationOnPlanet();
		}
		
		public function getCheckpoint():int
		{
			return checkpoint;
		}
		// returns true if the planet is a valid checkpoint planet
		public function isCheckpoint():Boolean
		{
			if ((checkpoint > 0) && (checkpoint <= 360))
			{
				return true;
			}
			else return false;
		}
		
		public function playerCollision(player:Player):void
		{
			
		}
		
		public function getRadii():Number {
			return height / 2;
		}
	}
}