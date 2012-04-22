package  
{
	import org.flixel.FlxPoint;
	
	/**
	 * ...
	 * @author 
	 */
	public class GrapePlanet extends Planet
	{
		
		public static const DEFAULT_MASS:int = 6;
		public static const DEFAULT_SIZE:int = 148;
		
		private var planet_background:PlanetBackground;
		
		[Embed(source = "../assets/planets/grape-planet.png")] private var grape_planet:Class;		
		[Embed(source = "../assets/planets/grapesbackground.png")] private var grape_background:Class;

		public function GrapePlanet(x:int, y:int, scale:Number=1 ,checkpoint:int=0, mass:Number=DEFAULT_MASS) 
		{
			super(x, y, checkpoint);
			this.planetMass = mass;
			this.checkpoint = 0;
			this.loadGraphic(grape_planet);
			planet_background = new PlanetBackground(this.x, this.y, grape_background);
			
			this.setSize (DEFAULT_SIZE * scale);
			this.scale = new FlxPoint(scale, scale);
			planet_background.scale = new FlxPoint(scale, scale);

		}
		
		override public function update():void
		{
			planet_background.update();
			super.update();		
		}
		
		override public function draw():void
		{
			planet_background.draw();
			super.draw();		
		}
		
	}

}