package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Chris
	 */
	public class SpongePlanet extends Planet 
	{
		public static const DEFAULT_MASS:Number = 5;
		public static const DEFAULT_SIZE:Number = 528;
		
		private var planet_background:PlanetBackground;
		
		[Embed(source = "../assets/planets/sponge.png")] private var sponge_planet:Class;		
		[Embed(source="../assets/audio/checkpoint.mp3")] private var checkpoint_sound:Class;		
		
		public function SpongePlanet(x:int, y:int, scale:Number = 1, checkpoint:int = 0, mass:Number = DEFAULT_MASS)
		{
			super(x, y, checkpoint);
			
			this.loadGraphic(sponge_planet);
			this.planetMass = mass;
			this.setSize (DEFAULT_SIZE * scale);
			this.scale = new FlxPoint(scale, scale);
			this.checkpoint = checkpoint;
		}
		
		override public function playerCollision(player:Player):void
		{
			player.reachedCheckpoint(this);
			FlxG.play(checkpoint_sound);
		}
	}

}