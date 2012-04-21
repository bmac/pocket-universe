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
			//TODO: Change the size of the call into the constructor
			super(x, y, checkpoint, 100);
			//this.loadGraphic(sponge_planet, , , , );
			//planet_background = new PlanetBackground(this.x, this.y, sponge_background);
			this.planetMass = SPONGE_MASS;
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
			player.reachedCheckpoint(this);
		}
	}

}