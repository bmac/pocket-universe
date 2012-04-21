package  
{
	/**
	 * ...
	 * @author Chris
	 */
	public class SpongePlanet extends Planet 
	{
		public const SPONGE_MASS:int = 1;
		
		private var planet_background:PlanetBackground;
		
		//[Embed(source = "../assets/planets/*-planet.png")] private var *_planet:Class;		
		//[Embed(source = "../assets/planets/*background.png")] private var *_background:Class;
		
		public function SpongePlanet(x:int, y:int, checkpoint:int) 
		{
			super(x, y, checkpoint);
			//this.loadGraphic(*.png);
			//planet_background = new PlanetBackground(this.x, this.y, *.png);
			this._mass = SPONGE_MASS;
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