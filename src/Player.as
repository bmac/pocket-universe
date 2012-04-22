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
		
		[Embed(source="../assets/drop/ALL THE SPRITES.png")]
		private var player_Sprite:Class;
		
		private var planets:FlxGroup;
		private var anti_gravity_flag:Boolean = false;
		private var animate_splash_flag:Boolean = false;
		
		public const INPUT_VELOCITY:Number = 30;
		public const G:Number = 90;
		
		public const ANTI_GRAVITY:Number = -120;
		
		private var isJumping:Boolean = false;
		
		private var keyboardEnabled:Boolean = true;
		//player win
		private var levelSuccess:Boolean = false;
		
		//player checkpoint
		private var currentCheckpoint:SpongePlanet;
		
		//player boosts
		private var timer:FlxTimer = new FlxTimer();
		
		/*private var frozen:Boolean = false;*/
		
		private var _currentPlanet:Planet;
		
		//The player's position on the current planet
		private var _locationOnPlanet:Number;
		
		private var _playerSpeed:int = 1;
		
		public function Player(firstPlanet:SpongePlanet, planets:FlxGroup)
		{
			this.planets = planets;
			currentCheckpoint = firstPlanet;
			currentCheckpoint.addWater();
			_locationOnPlanet = currentCheckpoint.getCheckpoint()
			this._currentPlanet = firstPlanet;
			this.loadGraphic(player_Sprite, true, true, 150, 150);
			this.addAnimation('jump', [1, 2, 3], 6, false);
			this.addAnimation('stand', [0], 6, false);
			this.addAnimation('crawl', [4, 5, 6, 7, 8], 6, false);
			this.addAnimation('die', [9, 10, 11, 12, 13, 14], 6, false);
			this.addAnimation('splash', [15, 16, 17, 18, 19, 20, 21, 22, 23], 6, false);
			this.addAnimation('idle', [0, 1, 2, 1, 0, 0, 0, 0], 6, true);
			firstPlanet.PlaceOnPlanet(this);
			this.addAnimationCallback(animationCallback);
			
			this.play("idle");
		}
		
		override public function update():void
		{
			do_input();
			
			super.update();
		}
		
		public function do_input():void
		{
			
			if (!_currentPlanet)
			{
				do_planet_gravity();
			}
			else
			{
				velocity.x = 0;
				velocity.y = 0;
			}
			
			//this.play("stand");
			if (!this.isWalking()) //Player already landed on a planet
			{
				//player is floating around, check to see if he has landed on a planet
				if (this.is_on_planet())
				{
					// find the overlaping planet (ie the planet the player landed on)
					var planet:Planet;
					for (var i:int = 0, len:int = planets.length; i < len; i++)
					{
						planet = planets.members[i];
						if (this.getRadius() + planet.getRadius() > FlxU.getDistance(getCenter(), planet.getCenter()))
						{
							
							//Land on the planet!
							_currentPlanet = planet;
							this.play("idle");
							_currentPlanet.playerCollision(this);
							planet.HelpReceivePlayer(this);
							velocity.x = 0;
							velocity.y = 0;
							break;
						}
					}
				}
			}
			if (keyboardEnabled)
			{
				// player jumps perpendicular using spacebar
				if (FlxG.keys.SPACE && (_currentPlanet != null))
				{
					
					this.play("jump");
					var xx:Number = _currentPlanet.getCenter().x - this.getCenter().x;
					var yy:Number = _currentPlanet.getCenter().y - this.getCenter().y;
					var r:Number = Math.sqrt(xx * xx + yy * yy);
					
					var gravitational_strength:Number = G * _currentPlanet.getMass() / Math.pow(r, 2);
					
					var gravity_x:Number = _currentPlanet.getCenter().x - this.getCenter().x;
					var gravity_y:Number = _currentPlanet.getCenter().y - this.getCenter().y;
					
					this.velocity.x = gravity_x * gravitational_strength * ANTI_GRAVITY;
					this.velocity.y = gravity_y * gravitational_strength * ANTI_GRAVITY;
					_currentPlanet = null;
					
				}
				
				// player walks around the current planet using left and right arrow keys
				if (this.isWalking() && !animate_splash_flag)
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
				
				if ((FlxG.keys.justReleased("LEFT") || FlxG.keys.justReleased("RIGHT")) && (isWalking()))
				{
					this.play("idle");
				}
			}
			if (animate_splash_flag)
			{
				this.x += (getCenter().x > this._currentPlanet.getCenter().x) ? -1 : 1;
				this.y += (getCenter().y > this._currentPlanet.getCenter().y) ? -1 : 1;
			}
		}
		
		private function enableGravity(unused:Object):void
		{
			isJumping = false;
		}
		
		public function isWalking():Boolean
		{
			return (this._currentPlanet != null);
		}
		
		public function do_planet_gravity():void
		{
			if (!this.isWalking())
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
		public function reachedCheckpoint(checkpointPlanet:SpongePlanet):void
		{
			if (checkpointPlanet.x != currentCheckpoint.x)
			{
				currentCheckpoint.removeWater();
				currentCheckpoint = checkpointPlanet;
				currentCheckpoint.addWater();
			}
		}
		
		// function for player success
		public function setSuccess():void
		{
			keyboardEnabled = false;
			this.play("splash");
			animate_splash_flag = true;
			timer.start(3, 1, playSplash);
		}
		
		public function playSplash(unused:Object):void
		{
			levelSuccess = true;
			keyboardEnabled = true;
			animate_splash_flag = false;
		
		}
		
		public function getSuccess():Boolean
		{
			return levelSuccess;
		}
		
		// function for player death
		public function dies():void
		{
			keyboardEnabled = false;
			this.play("die");
			timer.start(2.5, 1, deathAnimation);
		}
		
		public function deathAnimation(unused:Object):void
		{
			_currentPlanet = currentCheckpoint;
			_locationOnPlanet = currentCheckpoint.getCheckpoint();
			currentCheckpoint.PlaceOnPlanet(this);
			keyboardEnabled = true;
			this.play("idle");
		}
		
		// return the player's location as a point
		public function playerLocation():FlxPoint
		{
			return new FlxPoint(this.x, this.y);
		}
		
		public function getLocationOnPlanet():int
		{
			if (_locationOnPlanet == 0)
				return 360;
			
			return _locationOnPlanet;
		}
		
		public function setLocationOnPlanet(location:int):void
		{
			if (location < 1)
				location += 360;
			else if (location > 360)
				location -= 360;
			
			_locationOnPlanet = location;
		}
		
		public function is_on_planet():Boolean
		{
			for (var i:int = 0, len:int = planets.length; i < len; i++)
			{
				var planet:Planet = planets.members[i];
				
				if (this.getRadius() + planet.getRadius() > FlxU.getDistance(getCenter(), planet.getCenter()))
				{
					return true;
				}
			}
			return false;
		}
		
		public function getRadius():Number
		{
			return 25;
		}
		
		//Returns the center of this Circle in the world
		public function getCenter():FlxPoint
		{
			return new FlxPoint(this.origin.x + this.x, this.origin.y + this.y);
		}
		
		public function animationCallback( name:String, frameNum:uint, frameIndex:uint):void
		{
			if (name == "splash" && frameNum == 8) {
				this.kill();
			}
		}
	}

}