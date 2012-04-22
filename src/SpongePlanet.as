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
		private var sponge_overlay:FlxSprite;
		private var display_overlay:Boolean = false;
		
		[Embed(source = "../assets/planets/sponge.png")] private var sponge_planet:Class;
		[Embed(source = "../assets/planets/sponge-overlay-fill.png")] private var sponge_planet_overlay:Class;
		[Embed(source="../assets/audio/checkpoint.mp3")] private var checkpoint_sound:Class;		
		
		public function SpongePlanet(x:int, y:int, scale:Number = 1, checkpoint:int = 0, mass:Number = DEFAULT_MASS)
		{
			super(x, y, checkpoint);
			
			this.loadGraphic(sponge_planet);
			this.planetMass = mass;
			this.setSize (DEFAULT_SIZE * scale);
			this.scale = new FlxPoint(scale, scale);
			this.checkpoint = checkpoint;
			this.sponge_overlay = new FlxSprite(this.x, this.y);
			
			this.sponge_overlay.loadGraphic(sponge_planet_overlay, true, false, 528, 528, false)
			this.sponge_overlay.scale = this.scale;
			this.sponge_overlay.addAnimation("Soaking", [0, 1, 2, 3, 4, 5], 12, false);
			this.sponge_overlay.addAnimation("Drying", [5, 4, 3, 2, 1, 0], 12, false);
			FlxG.state.add(sponge_overlay);
		}
		
		override public function update():void
		{
			this.sponge_overlay.update();
			super.update();		
		}
		
		override public function draw():void
		{
			super.draw();
			if (display_overlay)
			{
				this.sponge_overlay.draw();
			}
		}
		
		override public function playerCollision(player:Player):void
		{
			player.reachedCheckpoint(this);
			FlxG.play(checkpoint_sound);
		}
		
		public function addWater():void
		{
			sponge_overlay.play("Soaking");
			display_overlay = true;
		}
		public function removeWater():void
		{
			sponge_overlay.play("Drying");
			
		}
		public function animationCallback( name:String, frameNum:uint, frameIndex:uint):void
		{
			if (name == "Drying" && frameIndex == 5) {
				display_overlay = false;
			}
		}
	}

}