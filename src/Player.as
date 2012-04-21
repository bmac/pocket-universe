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
		
		//player checkpoint
		private var currentCheckpoint:Planet;
		
		//player boosts
		private var timer:FlxTimer = new FlxTimer();
		
		private var frozen:Boolean = false;
		
		
		public function Player(point:FlxPoint, planets:FlxGroup)
		{
			this.planets = planets;
			super(20, 60);
			currentCheckpoint = planets.members[0];
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
			if (FlxG.keys.RIGHT && FlxG.overlap(this, planets)) {
				// find the overlaping planet
				var planet:Planet;
				for (var i:int = 0, len:int = planets.length; i < len; i++) {
					planet = planets.members[i];
					if (FlxG.overlap(this, planet)) {
						break;
					}
				}
				var new_position:FlxPoint = FlxU.rotatePoint(this.x, this.y, planet.x, planet.y, 1);
				this.x = new_position.x;
				this.y = -1 * new_position.y;
			}
			
			if (FlxG.keys.SPACE && FlxG.overlap(this, planets)) {
				do_planet_gravity();
				velocity.x = velocity.x * ANTI_GRAVITY;
				velocity.y = velocity.y * ANTI_GRAVITY;
			}
		}
		
		public function do_planet_gravity():void
		{
			for (var i:int = 0, len:int = planets.length; i < len; i++) {
				var planet:Planet = planets.members[i]; 
				var xx:Number = planet.x - this.x;
				var yy:Number = planet.y - this.y;
				var r:Number = Math.sqrt( xx * xx + yy * yy );
				
				var gravitational_strength:Number = G * planet.mass / Math.pow(r, 2);

				var gravity_x:Number = planet.x - this.x;
				var gravity_y:Number = planet.y - this.y;
				
				this.velocity.x += gravity_x * gravitational_strength;
				this.velocity.y += gravity_y * gravitational_strength;	
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
		
		// function for player death
		public function playerDies():void
		{
			// run death animation
			
		}
		
		// change animation to frozen
		public function freeze():void 
		{
			this.frozen = true;
			timer.start(10, 1, this.defrost);
		}
		
		// defrosts player
		public function defrost():void
		{
			this.frozen = false;
		}
		
	}

}