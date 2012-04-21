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
		
		//[Embed(source = "../assets/planets/grape-planet.png")] private var grape_planet:Class;		
		//[Embed(source = "../assets/planets/grapesbackground.png")] private var grape_background:Class;
		
		public function DonutPlanet(x:int, y:int, checkpoint:int) 
		{
			super(x, y, checkpoint);
			//this.loadGraphic(donut_planet, , , , );
			//planet_background = new PlanetBackground(this.x, this.y, donut_background);
			this.planetMass = DONUT_MASS;
			this.checkpoint = 0;
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
	}

}