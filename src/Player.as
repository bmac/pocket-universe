package
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	
	public class Player extends FlxSprite
	{
		
		private var planets:FlxGroup;
		private var anti_gravity_flag:Boolean = false;
		
		public const INPUT_VELOCITY:Number = 30;
		public const G:Number = 90;
		public const ANTI_GRAVITY:Number = -25;
		
		public function Player(planets:FlxGroup)
		{
			this.planets = planets;
			super(60, 35);
		
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

		}		
	
	}

}