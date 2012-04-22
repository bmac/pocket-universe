package levels 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author JR
	 */
	public class LevelTutorial extends Level 
	{
		private const baseUnit:int = DonutPlanet.DEFAULT_SIZE / 2;
		
		// tutorial text
		private var arrowKeybinds:FlxText = new FlxText			(baseUnit * 0,	baseUnit * 1,		200, "Use arrow keys to move around the planet!");
		private var spaceKeybind:FlxText = new FlxText			(baseUnit * 0, 	baseUnit * -.5, 	200, "Use the spacebar to jump off the planet!");
		private var spongeDescription:FlxText = new FlxText		(baseUnit * 5, 	baseUnit * -.5, 	200, "Sponge planets are checkpoints.  If you die, you respawn at the last sponge planet you touched");
		private var donutDescription:FlxText = new FlxText		(baseUnit * 3, 	baseUnit * -.5, 	200, "Donut planets are safe to land on");
		private var lightbulbDescription:FlxText = new FlxText	(baseUnit * 7, 	baseUnit * -.5, 	200, "Lightbulb planets cause you to evaporate! They send you back to the last Sponge Planet you touched");
		private var goalDescription:FlxText = new FlxText		(baseUnit * 10,	baseUnit * -.5, 	200, "Try to find and land on the goal planet, to beat the level!");
		
		override public function create():void
		{
			super.create();
			
			arrowKeybinds.setFormat(null, 20, 0xFF00FF, "center");
			spaceKeybind.setFormat(null, 20, 0xFF00FF, "center");
			spongeDescription.setFormat(null, 20, 0xFF00FF, "center");
			donutDescription.setFormat(null, 20, 0xFF00FF, "center");
			lightbulbDescription.setFormat(null, 20, 0xFF00FF, "center");
			goalDescription.setFormat(null, 20, 0xFF00FF, "center");
			
			add(arrowKeybinds);
			add(spaceKeybind);
			add(spongeDescription);
			add(donutDescription);
			add(lightbulbDescription);
			add(goalDescription);
		}

		override public function CreatePlanets(planets:FlxGroup):void 
		{
			// create all the planets for the level
			
			planets.add(new SpongePlanet	(baseUnit * 0,		baseUnit * 0,	 .5,	1));		//00
			planets.add(new DonutPlanet		(baseUnit * 3,		baseUnit * .5,	 .75,	0));		//01
			planets.add(new SpongePlanet	(baseUnit * 5,		baseUnit * 0,	 .5,	1));		//02
			planets.add(new LightbulbPlanet	(baseUnit * 8,		baseUnit * .5,	 .75,	0, 0.5));	//03
			planets.add(new DonutPlanet		(baseUnit * 7,		baseUnit * 3,	 .75,	0));		//04
			planets.add(new DonutPlanet		(baseUnit * 7,		baseUnit * -2,	 .75,	0));		//05
			planets.add(new HomePlanet		(baseUnit * 10,		baseUnit * 0,	 1,		0, 1.25));	//06	//15
		}
		override public function update():void
		{
			super.update();
			if (player.getSuccess())
			{
				//TODO: Determine what to do about win condition...
				FlxG.switchState(new Level01());
			}
		}
	}

}