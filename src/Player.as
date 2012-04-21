package
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	public class Player extends FlxSprite
	{
		
		private var planets:FlxGroup;
		
		public const MOVE_SPEED:Number = 100;
		public const RUN_ACCEL:Number = 700;
		public const RUN_DRAG:Number = 300;
		public const GRAVITY:Number = 400;
		public const JUMP_FORCE:Number = 140;
		public const JUMP_HOLD_FORCE:Number = 150;
		public const G:Number = 1;
		
		public function Player(planets:FlxGroup)
		{
			this.planets = planets;
			super(20, 20);
		
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
		
		}
		
		public function do_gravity():void
		{
			for (var i:int = 0, len:int = planets.length; i < len; i++) {
				var planet:Planet = planets.members[i]; 
				var xx:Number = planet.x - this.x;
				var yy:Number = planet.y - this.y;
				var r:Number = Math.sqrt( xx * xx + yy * yy );
				
				var gravitational_strength:Number = G * planet.mass / Math.pow(r, 2);
				angle = Math.atan2(this.x - planet.x, -(this.y - planet.y));
				velocity.x += Math.sin(angle) * gravitational_strength;
				velocity.y += Math.cos(angle) * gravitational_strength;
				
			}
		}
		
		public function do_animation():void
		{

		}		
	
	}

}