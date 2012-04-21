package
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxTimer;
	
	public class Player extends FlxSprite
	{
		
		private var planets:FlxGroup;
		
		public const MOVE_SPEED:Number = 100;
		public const RUN_ACCEL:Number = 700;
		public const RUN_DRAG:Number = 300;
		public const GRAVITY:Number = 400;
		public const JUMP_FORCE:Number = 140;
		public const JUMP_HOLD_FORCE:Number = 150;
		public const G:Number = 9.8;
		
		//player checkpoint
		private var currentCheckpoint:Planet = planets.members[0];
		
		//player boosts
		private var timer:FlxTimer = new FlxTimer();
		
		private var frozen:Boolean = false;
		
		
		public function Player(point:FlxPoint, planets:FlxGroup)
		{
			this.planets = planets;
			this.x = point.x;
			this.y = point.y;
		
		}
		
		override public function update():void
		{
			do_input();
			do_gravity();
			do_animation();
			super.update();		
		}
		
		public function do_input():void
		{
			if (FlxG.keys.A)
			{
				
			}
			if (FlxG.keys.D)
			{
				
			}
			if (FlxG.keys.SPACE)
			{
				
			}
		}
		
		public function do_gravity():void
		{
			for (var i:int = 0, len:int = planets.length; i < len; i++) {
				var planet:Planet = planets.members[i]; 
				var xx:Number = planet.x - this.x;
				var yy:Number = planet.y - this.y;
				var r:Number = Math.sqrt( xx * xx + yy * yy );
				
				var gravitational_strength:Number = G * planet.mass / Math.pow(r, 2);

				var gravity_x:Number = planet.x - this.x;
				var gravity_y:Number = planet.y - this.y;
				
				this.velocity.x = gravity_x * gravitational_strength;
				this.velocity.y = gravity_y * gravitational_strength;
				
				
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