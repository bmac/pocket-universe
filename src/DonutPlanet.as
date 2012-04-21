package  
{
	/**
	 * ...
	 * @author Chris
	 */
	public class DonutPlanet extends Planet 
	{
		public const DONUT_MASS:int = 1;
		
		private var planet_background:PlanetBackground;
		
		[Embed(source = "../assets/planets/DonutPlanet.png")] private var donut_planet:Class;		
		
		public function DonutPlanet(x:int, y:int, checkpoint:int) 
		{
			super(x, y, checkpoint);
			this.planetMass = DONUT_MASS;
			this.checkpoint = 0;
			this.loadGraphic(donut_planet);
		}
		
	}

}