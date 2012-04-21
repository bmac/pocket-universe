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
		
		[Embed(source = "../assets/planets/sponge.png")] private var sponge_planet:Class;		
		
		public function SpongePlanet(x:int, y:int, checkpoint:int) 
		{
			super(x, y, checkpoint, 100);
			this.loadGraphic(sponge_planet);
			this.planetMass = SPONGE_MASS;
		}
		
		
		override public function playerCollision(player:Player):void
		{
			player.reachedCheckpoint(this);
		}
	}

}