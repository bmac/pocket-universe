package  
{
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author Chris
	 */
	public class DonutPlanet extends Planet 
	{
		public static const DEFAULT_DONUT_MASS:int = 8;
		
		private var planet_background:PlanetBackground;
		
		[Embed(source = "../assets/planets/doughnut.png")] private var donut_planet:Class;		
		
		public function DonutPlanet(x:int, y:int, scale:Number=1 ,checkpoint:int=0, mass:Number=DEFAULT_DONUT_MASS) 
		{
			super(x, y, checkpoint);
			this.planetMass = mass;
			this.checkpoint = 0;
			this.loadGraphic(donut_planet);
			
			this.setSize (352 * scale);
			this.scale = new FlxPoint(scale,scale);
		}
		
	}

}