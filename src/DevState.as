package
{
	import org.flixel.*;

	public class DevState extends FlxState
	{
		
		private var planets:FlxGroup;
		private var obstacles:FlxGroup;
		private var devCamera:DevCamera;
		
		public function PlayState():void
		{
		}

		override public function create():void
		{
			// create all the planets for the level
			planets = new FlxGroup();
			planets.add(new Planet(10, 20, 1));
			
			// create all the obstacles for the level
			obstacles = new FlxGroup();
			
			// create the camera
			devCamera = new DevCamera();
			
			// add all to the world
			add(planets);
			add(obstacles);
			add(devCamera);
		}
	}
}