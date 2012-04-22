package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author 
	 */
	public class LightbulbPlanet extends Planet
	{
		public static const DEFAULT_MASS:Number = 5;
		public static const DEFAULT_SIZE:Number = 330;
		
		private var planet_background:PlanetBackground;
		
		
		[Embed(source="../assets/planets/Lightblulb-surfaceanimation.png")] private var lightbulb_planet:Class;		
		[Embed(source="../assets/planets/lightblulbbackground.png")] private var lightbulb_background:Class;
		[Embed(source="../assets/audio/fail.mp3")] private var fail_sound:Class;
		
		public function LightbulbPlanet(x:int, y:int, scale:Number=1 ,checkpoint:int=0, mass:Number=DEFAULT_MASS) 
		{
			super(x, y, checkpoint);
			this.loadGraphic(lightbulb_planet, true, false, 332, 330);
			this.addAnimation("Flash", [0, 1, 2, 3, 2, 1], 1, true);
			planet_background = new PlanetBackground(this.x, this.y, lightbulb_background);
			this.planetMass = mass;
			this.setSize (DEFAULT_SIZE * scale);
			
			this.scale = new FlxPoint(scale, scale);
			planet_background.scale = new FlxPoint(scale, scale);
			this.checkpoint = 0;	
		}

		
		override public function update():void
		{
			this.play("Flash");
			planet_background.update();
			super.update();		
		}
		
		override public function draw():void
		{
			planet_background.draw();
			super.draw();		
		}
		
		override public function playerCollision(player:Player):void
		{
			player.dies();
			FlxG.play(fail_sound);
		}
	}
}