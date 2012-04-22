package levels 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	
	/**
	 * ...
	 * @author JR
	 */
	public class LevelTutorial extends Level 
	{
		private const baseUnit:int = DonutPlanet.DEFAULT_SIZE / 2;
		
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
				FlxG.switchState(new Level03());
			}
		}
	}

}