package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		private var camera:Camera;
		private var planets:FlxGroup;
		private var player:Player;
		private var obstacles:FlxGroup;
		

		//camera options
		private var cameraOrigin:FlxPoint = new FlxPoint(0, 0);
		private var width:int = 640;
		private var height:int = 480;
		private var zoom:int = 1;
		
		
		public function PlayState()
		{
		}

		override public function create():void
		{			
			// create all the planets for the level
			planets = new FlxGroup();
			planets.add(new Planet(10, 20, 1));
			planets.add(new Planet(200, 40, 0));
			planets.add(new Planet(40, 90, 0));

			// create all the obstacles for the level
			obstacles = new FlxGroup();
			
			// create the player
			player = new Player(planets.members[0].getPointAt(planets.members[0].getCheckpoint()), planets);
			
			// create camera
			camera = new Camera(cameraOrigin, width, height, zoom, player);
			
			// add all to the world
			add(planets);
			add(obstacles);
			add(player);
			add(camera);
		}
	}
}