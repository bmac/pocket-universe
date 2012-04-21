package  
{
	/**
	 * ...
	 * @author Chris
	 */
	public class HomePlanet extends Planet 
	{
		public const HOME_MASS:int = 1;
		
		private var planet_background:PlanetBackground;
		
		//[Embed(source = "../assets/planets/*-planet.png")] private var *_planet:Class;		
		//[Embed(source = "../assets/planets/*background.png")] private var *_background:Class;
		
		public function HomePlanet(x:int, y:int, checkpoint:int) 
		{
			super(x, y, checkpoint);
			//this.loadGraphic(home_planet, , , , );
			//planet_background = new PlanetBackground(this.x, this.y, home_planet_background);
			this.planetMass = HOME_MASS;
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
			player.success();
		}
	}

}