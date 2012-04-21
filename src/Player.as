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
	
	public class Player extends FlxSprite
	{
		
		[Embed (source = "../assets/drop/jump_frame_1.png")] private var player_Sprite:Class;

		
		private var planets:FlxGroup;
		private var anti_gravity_flag:Boolean = false;
		
		public const INPUT_VELOCITY:Number = 30;
		public const G:Number = 90;
		public const ANTI_GRAVITY:Number = -100;
		
		//player win
		private var levelSuccess:Boolean = false;
		
		//player checkpoint
		private var currentCheckpoint:Planet;
		
		//player boosts
		private var timer:FlxTimer = new FlxTimer();
		
		private var _currentPlanet:Planet;
		
		//The player's position on the current planet
		private var _locationOnPlanet:Number = 1;
		
		private var frozen:Boolean = false;
		
		private var _playerSpeed:int = 1;
		
		public function Player(firstPlanet:Planet, planets:FlxGroup)
		{
			this.planets = planets;
			super(20, 60);
			currentCheckpoint = firstPlanet;
			firstPlanet.PlaceOnPlanet(this);
		}
		
		override public function update():void
		{
			if (!FlxG.overlap(this, planets)){
				do_planet_gravity();
			} else {
				velocity.x = 0;
				velocity.y = 0;
			}
			do_input();
			do_animation();
			super.update();		
		}
		
		public function do_input():void
		{
			if (this.getIsWalking()) //Player already landed on a planet
			{
				//Jump code goes here?
			}
			else
			{
				//player is floating around, check to see if he has landed on a planet
				if (FlxG.overlap(this, planets))
				{
					// find the overlaping planet (ie the planet the player landed on)
					var planet:Planet;
					for (var i:int = 0, len:int = planets.length; i < len; i++) {
						planet = planets.members[i];
						if (FlxG.overlap(this, planet)) 
						{
							_currentPlanet = planet;
							break;
						}
					}
				}
			}
			
			if (this.getIsWalking())
			{
				/*
				//more test code
				if (FlxG.keys.RIGHT)
					_locationOnPlanet = (90);
				if (FlxG.keys.LEFT)
					_locationOnPlanet =  (270);
				if (FlxG.keys.DOWN)
					_locationOnPlanet = (180);
				if (FlxG.keys.UP)
					_locationOnPlanet = (360);
				*/
					
				_currentPlanet.PlaceOnPlanet(this);
				
				if ((FlxG.keys.RIGHT || FlxG.keys.LEFT) ) 
				{
						
						var playerSpeed:int = 1;
					
						//Move the player left or right on the planet
						if (FlxG.keys.RIGHT)
							_locationOnPlanet+= _playerSpeed;
						if (FlxG.keys.LEFT)
							_locationOnPlanet-= _playerSpeed;
						
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
			
			if (FlxG.keys.SPACE && FlxG.overlap(this, planets) ) {
				_currentPlanet = null;
				do_planet_gravity();
				velocity.x = velocity.x * ANTI_GRAVITY;
				velocity.y = velocity.y * ANTI_GRAVITY;
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
				for (var i:int = 0, len:int = planets.length; i < len; i++) {
					var planet:Planet = planets.members[i]; 
					var xx:Number = planet.x - this.x;
					var yy:Number = planet.y - this.y;
					var r:Number = Math.sqrt( xx * xx + yy * yy );
					
					var gravitational_strength:Number = G * planet.getMass() / Math.pow(r, 2);

					var gravity_x:Number = planet.x - this.x;
					var gravity_y:Number = planet.y - this.y;
					
					this.velocity.x += gravity_x * gravitational_strength;
					this.velocity.y += gravity_y * gravitational_strength;	
				}
			}
		}
		
		public function do_animation():void
		{
			// run appropriate animation
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
		
		// change player to frozen
		public function freeze():void 
		{
			// change animation to frozen
			this.frozen = true;
			timer.start(10, 1, this.defrost);
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
		
		// defrosts player
		public function defrost():void
		{
			// return animation to normal
			this.frozen = false;
		}
	}

}