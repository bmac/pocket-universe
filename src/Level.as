package  
{
	/**
	 * ...
	 * @author Vinny
	 */
	import org.flixel.*;
	import flash.geom.Point;

	public class Level extends FlxState
	{
		public const CAM_SPEED:Number = 500;
		private var planets:FlxGroup = new FlxGroup();
		protected var player:Player;
		private var obstacles:FlxGroup;
		private var starfield:FlxGroup;
		private var music:MusicController;
		
		//camera options
		private var camTarget:FlxObject = new FlxObject(0,0,0,0);

		public function CreatePlanets(planets:FlxGroup) : void 
		{
			// First planet created is starting planet
			// Second planet created should be home
			throw Error("Please Override CreatePlanets Method");
		}
		
		[Embed(source = "../assets/yaybackground.png")] private var bg:Class;
		
		override public function create():void
		{			
			
			this.CreatePlanets(planets);
			
			// create the player
			player = new Player(planets.members[0], planets);
			
			// create camera
			camTarget.x = planets.members[1].getCenter().x;
			camTarget.y = planets.members[1].getCenter().y;
			FlxG.camera.target = camTarget;
			
			// start the music
			music = new MusicController();
			
			
			//add(new FlxSprite(0,0,bg));
			
			// add all to the world
			add(camTarget);
			add(planets);
			//add(obstacles);
			add(player);
			
			FlxG.bgColor = 0xff181818;

			starfield = new FlxGroup();
			add(starfield);

			for (var i:int = 0; i < 150; i++)
			{
				var s:Star = new Star();
				s.spawn(Math.random() * FlxG.camera.screen.width, Math.random() * FlxG.camera.screen.height - 10);
				s.scrollFactor = new FlxPoint(-0.05, -0.05);
				starfield.add(s);
				
			}
			for (var i:int = 0; i < 150; i++)
			{
				s = new Star();
				s.spawn(Math.random() * FlxG.camera.screen.width, Math.random() * FlxG.camera.screen.height - 10);
				s.scrollFactor = new FlxPoint(-0.025, -0.025);
				starfield.add(s);
				
			}
			
			

		}
		
		override public function update():void
		{
			super.update();
			if (player.getQuit())
			{
				//TODO: Determine what to do about win condition...
				FlxG.switchState(new MenuState());
			}
			var tempPoint:Point = new Point((player.x + player.width/2 - camTarget.x), (player.y + player.height/2 - camTarget.y));
			tempPoint.normalize(1);
			camTarget.velocity.x = tempPoint.x * CAM_SPEED;
			camTarget.velocity.y = tempPoint.y * CAM_SPEED;
		}
	}

}