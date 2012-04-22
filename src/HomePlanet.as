package  
{
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author Chris
	 */
	public class HomePlanet extends Planet 
	{
		public static const DEFAULT_MASS:int = 5;
		public static const DEFAULT_SIZE:int = 534;
		
		private var planet_background:PlanetBackground;
		
		[Embed(source="../assets/planets/WATER PLANET.png")] private var water_planet:Class;		
		//[Embed(source = "../assets/planets/*background.png")] private var *_background:Class;
		
		public function HomePlanet(x:int, y:int, scale:Number=1 ,checkpoint:int=0, mass:Number=DEFAULT_MASS) 
		{
			super(x, y, checkpoint);
			this.loadGraphic(water_planet);
			this.planetMass = mass;
			
			this.setSize (DEFAULT_SIZE * scale);

			this.scale = new FlxPoint(scale, scale);
			this.checkpoint = checkpoint;
		}
		
		/*override public function update():void
		{
			planet_background.update();
			super.update();		
		}
		
		override public function draw():void
		{
			planet_background.draw();
			super.draw();		
		}*/
		
		override public function playerCollision(player:Player):void
		{
			player.setSuccess();
		}
	}

}