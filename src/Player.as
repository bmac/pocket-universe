package
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	import org.flixel.FlxTimer;
	import flash.geom.Point;
	
	public class Player extends FlxSprite
	{
		
		[Embed(source="../assets/drop/sprite sheet smaller.png")]
		private var player_Sprite:Class;
		
		private var planets:FlxGroup;
		private var anti_gravity_flag:Boolean = false;
		
		public const INPUT_VELOCITY:Number = 30;
		public const G:Number = 90;
		public const ANTI_GRAVITY:Number = 250;
		
		//player win
		private var levelSuccess:Boolean = false;
		
		//player checkpoint
		private var currentCheckpoint:Planet;
		
		/*/player boosts
		private var timer:FlxTimer = new FlxTimer();
				
		private var frozen:Boolean = false;*/
		
		private var _currentPlanet:Planet;
		
		//The player's position on the current planet
		private var _locationOnPlanet:Number;
		
		private var _playerSpeed:int = 1;
		
		public function Player(firstPlanet:Planet, planets:FlxGroup)
		{
			this.planets = planets;
			currentCheckpoint = firstPlanet;
			_locationOnPlanet = currentCheckpoint.getCheckpoint()
			//firstPlanet.PlaceOnPlanet(this);
			this.loadGraphic(player_Sprite, true, true, 60, 50);
			this.addAnimation('crawl', [0, 1, 2, 3, 4], 6, false);
		}
		
		override public function update():void
		{
			if (!_currentPlanet){
				do_planet_gravity();
			}
			else
			{
				velocity.x = 0;
				velocity.y = 0;
			}
			do_input();

			super.update();		
		}
		
		public function do_input():void
		{
			if (!this.getIsWalking()) //Player already landed on a planet
			{
				//player is floating around, check to see if he has landed on a planet
				if (this.is_on_planet())
				{
					// find the overlaping planet (ie the planet the player landed on)
					var planet:Planet;
					for (var i:int = 0, len:int = planets.length; i < len; i++)
					{
						planet = planets.members[i];
						if (FlxG.overlap(this, planet))
						{
							_currentPlanet = planet;
							break;
						}
					}
				}
			}
			
			// player jumps perpendicular using spacebar
			if (FlxG.keys.justPressed("SPACE") && (_currentPlanet != null)) {
				var tempPlanet:Planet = _currentPlanet;
				_currentPlanet = null;
				
				var tempPoint:Point = new Point
					(this.x - tempPlanet.getCenter().x, this.y - tempPlanet.getCenter().y);
				tempPoint.normalize(1);
				velocity.x = tempPoint.x * ANTI_GRAVITY;
				velocity.y = tempPoint.y * ANTI_GRAVITY;
				
				
			}
			
			// player walks around the current planet using left and right arrow keys
			if (this.getIsWalking())
			{
				if (FlxG.keys.U)
				{
					_locationOnPlanet = 360;
					_currentPlanet.PlaceOnPlanet(this);
				}
				
				
				if ((FlxG.keys.RIGHT || FlxG.keys.LEFT))
				{				
						this.play("crawl");

						//Move the player left or right on the planet
						if (FlxG.keys.RIGHT)
						{
							_locationOnPlanet += _playerSpeed;
							this.facing = FlxObject.RIGHT;
						}
						if (FlxG.keys.LEFT)
						{
							_locationOnPlanet -= _playerSpeed;
							this.facing = FlxObject.LEFT;
						}
						
						//Makes sure that the new position is within bounds
						if (_locationOnPlanet > 360)
						{
							_locationOnPlanet -= 360;
						}
						if (_locationOnPlanet <= 0)
						{
							_locationOnPlanet += 360;
						}
							
						this._currentPlanet.PlaceOnPlanet(this);
					
					var playerSpeed:int = 1;
					
					//Move the player left or right on the planet
					if (FlxG.keys.RIGHT)
						_locationOnPlanet += _playerSpeed;
					if (FlxG.keys.LEFT)
						_locationOnPlanet -= _playerSpeed;
					
					//Makes sure that the new position is within bounds
					if (_locationOnPlanet > 360)
					{
						_locationOnPlanet -= 360;
					}
					if (_locationOnPlanet < 0)
					{
						_locationOnPlanet += 360;
					}
					
					this._currentPlanet.PlaceOnPlanet(this);
				}
			}
		}
		
		public function getIsWalking():Boolean
		{
			return (this._currentPlanet != null);
		}
		
		public function do_planet_gravity():void
		{
			if (!this.getIsWalking())
			{
				for (var i:int = 0, len:int = planets.length; i < len; i++)
				{
					var planet:Planet = planets.members[i];
					var xx:Number = planet.getCenter().x - this.getCenter().x;
					var yy:Number = planet.getCenter().y - this.getCenter().y;
					var r:Number = Math.sqrt(xx * xx + yy * yy);
					
					var gravitational_strength:Number = G * planet.getMass() / Math.pow(r, 2);
					
					var gravity_x:Number = planet.getCenter().x - this.getCenter().x;
					var gravity_y:Number = planet.getCenter().y - this.getCenter().y;
					
					this.velocity.x += gravity_x * gravitational_strength;
					this.velocity.y += gravity_y * gravitational_strength;
				}
			}
		}
		
		// function for touching checkpoint
		public function reachedCheckpoint(checkpointPlanet:Planet):void
		{
			currentCheckpoint = checkpointPlanet;
		}
		
		// function for player success
		public function setSuccess():void
		{
			levelSuccess = true;
		}
		
		public function getSuccess():Boolean
		{
			return levelSuccess;
		}
		
		// function for player death
		public function dies():void
		{
			// run death animation
			this.x = currentCheckpoint.getPointAt(currentCheckpoint.getCheckpoint()).x;
			this.y = currentCheckpoint.getPointAt(currentCheckpoint.getCheckpoint()).y;
		}
		
		// return the player's location as a point
		public function playerLocation():FlxPoint
		{
			return new FlxPoint(this.x, this.y);
		}

		public function getLocationOnPlanet():int
		{
			return _locationOnPlanet;
		}
		
		public function setLocationOnPlanet(location:int):void
		{
			if ((location < 1) || (location > 360))
			{
				throw new ArgumentError("Position is out of bounds. Must be within 1-360");
			}
			
			_locationOnPlanet = location;
		}
				
		/*/ change player to frozen
		public function freeze():void 
		{
			// change animation to frozen
			this.frozen = true;
			timer.start(10, 1, this.defrost);
		}
		
		// defrosts player
		public function defrost():void
		{
			// return animation to normal
			this.frozen = false;
		}*/
		
		public function is_on_planet():Boolean
		{
			for (var i:int = 0, len:int = planets.length; i < len; i++)
			{
				var planet:Planet = planets.members[i];
				if (this.getRadii() + planet.getRadii() > FlxU.getDistance(new FlxPoint(getCenter().x, getCenter().y), planet.getCenter()))
				{
					return true;
				}
			}
			return false;
		
		}
		
		public function getRadii():Number
		{
			return height / 2;
		}
		
		//Returns the center of this Circle in the world
		public function getCenter():FlxPoint
		{
			return new FlxPoint(this.origin.x + this.x, this.origin.y + this.y);
		}
	}

}