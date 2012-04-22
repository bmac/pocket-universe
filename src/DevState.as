package
{
	import flash.ui.Mouse;
	import org.flixel.*;

	public class DevState extends FlxState
	{
		/*
		 * How to use the DevState:
			 * Use "WASD" to move the camera around the screen
			 * Hit "Q" to return to the menu
			 * Hit "R" to center on the player object
			 * 
			 * Coords at bottom of the screen indicate the x and y 
			 * for the current center point on the screen
			 * 
			 * Add your planets in the CreatePlanets function
				* NOTE * Always have at least one planet in this function
		 	 *
			 * Completing your Dev level returns you to the main menu
		 */
		
		public function DevState():void
		{
		}
		
		private var planets:FlxGroup = new FlxGroup();
		protected var player:Player;
		private var obstacles:FlxGroup;
		private var starfield:FlxGroup;
		private var music:MusicController;

		//camera options
		private var camTarget:FlxObject = new FlxObject(0,0,1,1);
		
		// coords stuff
		private var screenCenterLoc:FlxText = new FlxText(250, 205, 200, "");

		public function CreatePlanets(planets:FlxGroup):void 
		{
			// populate universe with planets here
			
		}
		
		[Embed(source = "../assets/yaybackground.png")] private var bg:Class;
		
		override public function create():void
		{			
			
			this.CreatePlanets(planets);
			
			// create the player
			player = new Player(planets.members[0], planets);
			
			// create camera
			FlxG.camera.target = camTarget;
			// start the music
			music = new MusicController();
			
			// coords
			screenCenterLoc.setFormat(null, 20, 0xFF00FF, "center");
			
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
			for (i = 0; i < 150; i++)
			{
				s = new Star();
				s.spawn(Math.random() * FlxG.camera.screen.width, Math.random() * FlxG.camera.screen.height - 10);
				s.scrollFactor = new FlxPoint(-0.025, -0.025);
				starfield.add(s);
				
			}
			
			// add all to the world
			add(planets);
			add(player);
			add(screenCenterLoc);
		}
		
		override public function update():void
		{
			super.update();
			
			if (player.getSuccess())
			{
				//TODO: Determine what to do about win condition...
				FlxG.switchState(new MenuState());
			}
			this.userInput();
			
			// keeps screen coords on screen and up to date
			screenCenterLoc.x = camTarget.x +250;
			screenCenterLoc.y = camTarget.y +205;
			screenCenterLoc.text = "x: " + Math.floor(camTarget.x) + "|| y: " + Math.floor(camTarget.y);
		}
		 // keybinds
		public function userInput():void
		{
			if (FlxG.keys.W)
			{
				camTarget.y -= 20;
			}
			if (FlxG.keys.A)
			{
				camTarget.x -= 20;
			}
			if (FlxG.keys.S)
			{
				camTarget.y += 20;
			}
			if (FlxG.keys.D)
			{
				camTarget.x += 20;
			}
			if (FlxG.keys.R)
			{
				camTarget.x = player.x + player.width/2;
				camTarget.y = player.y + player.height/2;
			}
			if (FlxG.keys.Q)
			{
				FlxG.switchState(new MenuState());
			}
		}
	}
}