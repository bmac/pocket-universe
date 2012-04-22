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
		private var planets:FlxGroup = new FlxGroup();
		protected var player:Player;
		private var obstacles:FlxGroup;
		private var starfield:FlxGroup;
		private var music:MusicController;
		
		// goal distance
		private var goalDist:FlxText = new FlxText(250, 205, 200, "");
		private var goalPlanet:HomePlanet;
		
		public function CreatePlanets(planets:FlxGroup):void
		{
			// First planet created is starting planet
			// Second planet created should be home
			throw Error("Please Override CreatePlanets Method");
		}
		
		[Embed(source="../assets/yaybackground.png")]
		private var bg:Class;
		
		override public function create():void			
		{
			starfield = new FlxGroup();
			add(starfield);
			
			for (var i:int = 0; i < 150; i++)
			{
				var s:Star = new Star();
				s.spawn(Math.random() * FlxG.camera.screen.width, Math.random() * FlxG.camera.screen.height - 10);
				s.scrollFactor = new FlxPoint( -0.05, -0.05);
				starfield.add(s);
				
			}
			for (i = 0; i < 150; i++)
			{
				s = new Star();
				s.spawn(Math.random() * FlxG.camera.screen.width, Math.random() * FlxG.camera.screen.height - 10);
				s.scrollFactor = new FlxPoint(-0.025, -0.025);
				starfield.add(s);
				
			}

			this.CreatePlanets(planets);
			
			// create the player
			player = new Player(planets.members[0], planets);
			
			// goal reporting
			for (var i:int = 0; i < planets.members.length; i++)
			{
				if (planets.members[i] is HomePlanet)
				{
					goalPlanet = planets.members[i];
					break;
				}
			}
			
			goalDist.setFormat(null, 20, 0xFF00FF, "center");
			
			// create camera
			FlxG.camera.target = player;
			
			// start the music
			music = new MusicController();
						
			// add all to the world
			add(planets);
			add(goalDist);
			//add(obstacles);
			add(player);
		}
		
		override public function update():void
		{
			super.update();

			// Return to menu when Q is pressed
			if (FlxG.keys.Q)
			{
				FlxG.switchState(new MenuState());
			}
			goalDist.x = player.x +250;
			goalDist.y = player.y +205;
			goalDist.text = "Distance to goal: " + Math.floor(Math.abs(Math.sqrt(Math.pow((player.x + player.width / 2) - (goalPlanet.x + goalPlanet.width / 2), 2) + Math.pow((player.y + player.width / 2) - (goalPlanet.y + goalPlanet.width / 2), 2))));
		}
	}

}