package levels 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author Vinny
	 */
	public class Level03 extends Level
	{
		
		private const baseUnit:int = DonutPlanet.DEFAULT_SIZE / 2;
		
		override public function CreatePlanets(planets:FlxGroup):void 
		{
			// create all the planets for the level
			
			planets.add(new SpongePlanet	(baseUnit * -1,		baseUnit * -1,	.5,		135));		//00
			planets.add(new DonutPlanet		(baseUnit * 2,		baseUnit * 0,	.5,		0, 4));		//01
			planets.add(new DonutPlanet		(baseUnit * 4,		baseUnit * 0,	.5,		0, 4));		//02
			planets.add(new DonutPlanet		(baseUnit * 6,		baseUnit * 0,	.5,		0, 4));		//03
			planets.add(new SpongePlanet	(baseUnit * 8,		baseUnit * -.5,	.5,		225));		//04
			planets.add(new DonutPlanet		(baseUnit * 8,		baseUnit * 1.5,	.5,		0, 4));		//05
			planets.add(new DonutPlanet		(baseUnit * 8,		baseUnit * 2.5,	.5,		0, 4));		//06
			planets.add(new DonutPlanet		(baseUnit * 8,		baseUnit * 3.5,	.5,		0, 4));		//07
			planets.add(new DonutPlanet		(baseUnit * 8,		baseUnit * 4.5,	.5,		0, 4));		//08
			planets.add(new DonutPlanet		(baseUnit * 6,		baseUnit * 2,	.5,		0, 4));		//09
			planets.add(new DonutPlanet		(baseUnit * 6,		baseUnit * 3,	.5,		0, 4));		//10
			planets.add(new DonutPlanet		(baseUnit * 6,		baseUnit * 4,	.5,		0, 4));		//11
			planets.add(new SpongePlanet	(baseUnit * 9,		baseUnit * 6,	.5,		90));		//12
			planets.add(new HomePlanet		(baseUnit * 12.5,	baseUnit * 5.8,	.5,		0, 7));		//13
			planets.add(new DonutPlanet		(baseUnit * 15.5,		baseUnit * 8,	.5,		0, 30));	//14
			planets.add(new DonutPlanet		(baseUnit * -5,		baseUnit * 4,	.5,		0, 30));	//15
			
			
			planets.add(new LightbulbPlanet	(baseUnit * 10,		baseUnit * 3,	.5,		0));		//01
			planets.add(new LightbulbPlanet	(baseUnit * 3,		baseUnit * 3,	.5,		0));		//02
			planets.add(new LightbulbPlanet	(baseUnit * 4,		baseUnit * -2,	.5,		0));		//03
			planets.add(new LightbulbPlanet	(baseUnit * 4.5,	baseUnit * 1.5,	.5,		0));		//04
			planets.add(new LightbulbPlanet	(baseUnit * 3.75,	baseUnit * 2.25, .5,		0));	//05
			planets.add(new LightbulbPlanet	(baseUnit * 11.25,	baseUnit * 6.5,	.5,		0, 2));		//06	
		}
		
		override public function update():void
		{
			super.update();
			if (player.getSuccess())
			{
				FlxG.switchState(new Level04());
			}
		}
		
	}

}