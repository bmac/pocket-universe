package
{
	import flash.ui.Mouse;
	import org.flixel.*;

	public class DevState extends FlxState
	{		
		public function DevState():void
		{
		}
		
		private var planets:FlxGroup = new FlxGroup();
		protected var player:Player;
		private var obstacles:FlxGroup;
		private var music:MusicController;

		//camera options
		private var camTarget:FlxObject = new FlxObject(0,0,1,1);
		private var width:int = 16000;
		private var height:int = 9000;
		private var zoom:int = 0.25;
		
		// mouse stuff
		private var mouseLoc:FlxText = new FlxText(250, 205, 200, "");

		public function CreatePlanets(planets:FlxGroup):void 
		{
			// add planets here
			planets.add(new SpongePlanet(350, 350, 0.5, 1));
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
			
			// mouse
			mouseLoc.setFormat(null, 20, 0xFF00FF, "center");
			
			add(new FlxSprite(0,0,bg));
			
			// add all to the world
			add(planets);
			add(player);
			add(mouseLoc);
		}
		
		override public function update():void
		{
			super.update();
			if (player.getQuit())
			{
				//TODO: Determine what to do about win condition...
				FlxG.switchState(new MenuState());
			}
			if (player.getSuccess())
			{
				//TODO: Determine what to do about win condition...
				FlxG.switchState(new MenuState());
			}
			this.userInput();
			
			/*mouseLoc.x = FlxG.mouse.screenX;
			mouseLoc.y = FlxG.mouse.screenY + 20;\
			*/
			mouseLoc.text = "x: " + camTarget.x + "|| y: " + camTarget.y;
		}
		
		public function userInput():void
		{
			if (FlxG.keys.W)
			{
				camTarget.y -= 20;
				mouseLoc.y -= 20;
			}
			if (FlxG.keys.A)
			{
				camTarget.x -= 20;
				mouseLoc.x -= 20;
			}
			if (FlxG.keys.S)
			{
				camTarget.y += 20;
				mouseLoc.y += 20;
			}
			if (FlxG.keys.D)
			{
				camTarget.x += 20;
				mouseLoc.x += 20;
			}
		}
	}
}