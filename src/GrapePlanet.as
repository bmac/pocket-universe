package  
{
	/**
	 * ...
	 * @author 
	 */
	public class GrapePlanet extends Planet
	{
		public const GRAPE_MASS:int = 1;
		private var planet_background:PlanetBackground;
		
		[Embed(source = "../assets/planets/grape-planet.png")] private var grape_planet:Class;		
		[Embed(source = "../assets/planets/grapesbackground.png")] private var grape_background:Class;

		public function GrapePlanet(x:int, y:int, checkpoint:int) 
		{
			super(x, y, checkpoint);
			this.loadGraphic(grape_planet);
			planet_background = new PlanetBackground(this.x, this.y, grape_background);
			this.planetMass = GRAPE_MASS;

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