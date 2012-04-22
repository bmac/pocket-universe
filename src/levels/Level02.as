package levels 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	
	/**
	 * ...
	 * @author JR
	 */
	public class Level02 extends Level 
	{
		private const baseUnit:int = DonutPlanet.DEFAULT_SIZE / 2;
		
		override public function CreatePlanets(planets:FlxGroup):void 
		{
			// create all the planets for the level
			
			planets.add(new SpongePlanet	(baseUnit * .5,		baseUnit * -.5,	1,		135));	//00
			planets.add(new DonutPlanet		(baseUnit * 5,		baseUnit * 0,	.5,		0, 4));		//01
			planets.add(new SpongePlanet	(baseUnit * 7.5,	baseUnit * 0.5,	.5,		0));		//02
			planets.add(new DonutPlanet		(baseUnit * 11.5,	baseUnit * 1,	.5,		0, 4));		//03
			planets.add(new DonutPlanet		(baseUnit * 1,		baseUnit * 3,	.5,		0, 4));		//04
			planets.add(new DonutPlanet		(baseUnit * 5,		baseUnit * 2.5,	.5,		0, 4));		//05
			planets.add(new LightbulbPlanet	(baseUnit * 9.75,	baseUnit * 2,	.5,		0, 3));		//06
			planets.add(new SpongePlanet	(baseUnit * 8,		baseUnit * 4,	.5,		0));		//07
			planets.add(new DonutPlanet		(baseUnit * 12,		baseUnit * 4.2,	.5,		0, 4));		//08
			planets.add(new DonutPlanet		(baseUnit * 0,		baseUnit * 5.5,	.5,		0, 4));		//09
			planets.add(new LightbulbPlanet	(baseUnit * 4.5,	baseUnit * 5.2,	.5,		0, 3));		//10
			planets.add(new LightbulbPlanet	(baseUnit * 12,		baseUnit * 6,	.5,		0, 3));		//11
			planets.add(new SpongePlanet	(baseUnit * 2,		baseUnit * 7,	.5,		0));		//12
			planets.add(new DonutPlanet		(baseUnit * 6,		baseUnit * 6.6,	.5,		0, 4));		//13
			planets.add(new DonutPlanet		(baseUnit * 10,		baseUnit * 6.8,	.5,		0, 4));		//14
			planets.add(new HomePlanet		(baseUnit * 13,		baseUnit * 7,	.5,		0, 8));		//15
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