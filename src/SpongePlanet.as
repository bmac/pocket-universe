package  
{
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author Chris
	 */
	public class SpongePlanet extends Planet 
	{
		public const SPONGE_MASS:int = 5;
		
		private var planet_background:PlanetBackground;
		
		[Embed(source = "../assets/planets/sponge.png")] private var sponge_planet:Class;		
		
		public function SpongePlanet(x:int, y:int, scale:Number=1 ,checkpoint:int=0) 
		{			
			super(x, y, checkpoint);
			
			this.loadGraphic(sponge_planet);
			this.planetMass = SPONGE_MASS;
			this.setSize (528 * scale);
			this.scale = new FlxPoint(scale, scale);
			this.checkpoint = checkpoint;
		}
		
		override public function playerCollision(player:Player):void
		{
			player.reachedCheckpoint(this);
		}
	}

}