package  
{
	/**
	 * ...
	 * @author 
	 */
	public class LightbulbPlanet extends Planet
	{
		public const LIGHTBULB_MASS:int = 1;
		
		private var planet_background:PlanetBackground;
		
		
		[Embed(source="../assets/planets/Lightblulb-surfaceanimation.png")] private var lightbulb_planet:Class;		
		[Embed(source="../assets/planets/lightblulbbackground.png")] private var lightbulb_background:Class;
		
		public function LightbulbPlanet(x:int, y:int, checkpoint:int) 
		{
			super(x, y, checkpoint, 332);
			this.loadGraphic(lightbulb_planet, true, false, 332, 330);
			this.addAnimation("Flash", [0, 1, 2, 3], 1, true);
			planet_background = new PlanetBackground(this.x, this.y, lightbulb_background);
			this.planetMass = LIGHTBULB_MASS;
			this.checkpoint = 0;			
		}

		
		override public function update():void
		{
			this.play("Flash");
			planet_background.update();
			super.update();		
		}
		
		override public function draw():void
		{
			planet_background.draw();
			super.draw();		
		}
		
		override public function playerCollision(player:Player):void
		{
			//player.dies();
		}
	}
}