package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Chris
	 */
	public class HomePlanet extends Planet 
	{
		public static const DEFAULT_MASS:int = 5;
		public static const DEFAULT_SIZE:int = 534;
		
		private var planet_background:PlanetBackground;
		private var water_swirl_layer:PlanetBackground;
		private var lilly_pads:PlanetBackground;
		private var rotate_swirl:Boolean = false;
		private var flower:FlxSprite;
		
		[Embed(source="../assets/planets/WATER PLANET.png")] private var water_planet:Class;		
		[Embed(source = "../assets/planets/White Swirl.png")] private var water_swirl:Class;	
		[Embed(source="../assets/planets/Waterworld - Lillypad.png")] private var lilly_pads_sprite:Class;		
		[Embed(source="../assets/planets/Waterworld - Lilly - Spritesheet.png")] private var flower_sprite:Class;		
		[Embed(source="../assets/audio/win.mp3")] private var win_sound:Class;		
		
		//[Embed(source = "../assets/planets/*background.png")] private var *_background:Class;
		
		public function HomePlanet(x:int, y:int, scale:Number=1 ,checkpoint:int=0, mass:Number=DEFAULT_MASS) 
		{
			super(x, y, checkpoint);
			this.loadGraphic(water_planet);
			this.planetMass = mass;
			
			this.setSize (DEFAULT_SIZE * scale);

			this.scale = new FlxPoint(scale, scale);
			this.checkpoint = checkpoint;
			water_swirl_layer = new PlanetBackground(this.x, this.y, water_swirl, scale);
			lilly_pads = new PlanetBackground(this.x, this.y, lilly_pads_sprite, scale);
			//flower = new FlxSprite(this.x + 200, this.y + 200);
			//flower.loadGraphic(flower_sprite, true, false, 210, 225);
			//flower.addAnimation("win", [0, 1], 30, true);			
		}
		
		override public function update():void
		{
			if (rotate_swirl)
			{
				water_swirl_layer.angle += 5;
			}
			water_swirl_layer.update();
			lilly_pads.update();
			//flower.update();
			super.update();		
		}
		
		override public function draw():void
		{
			super.draw();
			water_swirl_layer.draw();
			lilly_pads.draw();
			//flower.draw();
		}
		
		override public function playerCollision(player:Player):void
		{
			player.setSuccess();
			rotate_swirl = true;
			FlxG.play(win_sound);
		}
	}

}