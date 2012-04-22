package  
{
	/**
	 * ...
	 * @author Vinny
	 */
	import org.flixel.*;

	public class Level extends FlxState
	{
		private var camera:Camera;
		private var planets:FlxGroup = new FlxGroup();
		private var player:Player;
		private var obstacles:FlxGroup;
		private var music:MusicController;

		//camera options
		private var cameraOrigin:FlxPoint = new FlxPoint(0, 0);
		private var width:int = 960;
		private var height:int = 540;
		private var zoom:int = 1;
		

		public function CreatePlanets(planets:FlxGroup) : void 
		{
			throw Error("Please Override CreatePlanets Method");
		}
		
		override public function create():void
		{	
			this.CreatePlanets(planets);
			
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
			if (player.getSuccess())
			{
				//TODO: Determine what to do about win condition...
				FlxG.switchState(new MenuState());
			}
		}
	}

}