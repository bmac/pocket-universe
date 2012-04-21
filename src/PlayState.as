package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		private var camera:Camera;
		private var planets:FlxGroup;
		private var player:Player;
		private var obstacles:FlxGroup;
		private var music:MusicController;

		//camera options
		private var cameraOrigin:FlxPoint = new FlxPoint(0, 0);
		private var width:int = 960;
		private var height:int = 540;
		private var zoom:int = 1;
		
		
		public function PlayState()
		{
		}

		override public function create():void
		{			
			// create all the planets for the level
			planets = new FlxGroup();
			//planets.add(new SpongePlanet(250, 250, 1));
			planets.add(new LightbulbPlanet(100, 70, 1));
			//planets.add(new LightbulbPlanet(800, 740, 0));
			planets.add(new LightbulbPlanet(400, 490, 0));
			//planets.add(new SpongePlanet(50, 50, 1));
			//planets.add(new LightbulbPlanet(100, 70, 1));
			//planets.add(new LightbulbPlanet(800, 740, 0));
			//planets.add(new LightbulbPlanet(200, 150, 0));
			//planets.add(new SpongePlanet(50, 500, 1));

			// create all the obstacles for the level
			//obstacles = new FlxGroup();
			
			// create the player
			player = new Player(planets.members[0], planets);
			
			// create camera
			FlxG.camera.target = player;
			
			// start the music
			music = new MusicController();
			
			// add all to the world
			add(planets);
			//add(obstacles);
			add(player);
		}
		
		override public function update():void
		{
			super.update();
			if (player.getSuccess() == true)
			{
				FlxG.switchState(new PlayState);
			}
		}
	}
}