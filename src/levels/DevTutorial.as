package levels 
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author ...
	 */
	public class DevTutorial extends DevState 
	{
		private const baseUnit:int = DonutPlanet.DEFAULT_SIZE / 2;
		
		public function DevTutorial() 
		{
		}
		
		override public function CreatePlanets(planets:FlxGroup):void 
		{
			// populate universe with planets here			
			/* planets in order:
				 * 00: (0,		0)		sponge [normal size]
				 * 01: (5,		0)		donut
				 * 02: (7.5,	0.5)	sponge
				 * 03: (11.5,	1)		donut
				 * 04: (1,		3)		donut
				 * 05: (5,		2.5)	donut
				 * 06: (9.75,	2)		lightbulb
				 * 07: (8,		4)		sponge
				 * 08: (12,		4.2)	donut
				 * 09: (0,		5.5)	donut
				 * 10: (4.5,	5.2)	lightbulb
				 * 11: (12,		6)		lightbulb
				 * 12: (2,		7)		sponge
				 * 13: (6,		6.6)	donut
				 * 14: (10,		6.8)	donut
				 * 15: (14,		7.5)	HOME
			*/
			planets.add(new SpongePlanet	(baseUnit * 0,		baseUnit * 0,	 .5,	1));		//00
			planets.add(new DonutPlanet		(baseUnit * 3,		baseUnit * .5,	 .75,	0));		//01
			planets.add(new SpongePlanet	(baseUnit * 5,		baseUnit * 0,	 .5,	1));		//02
			planets.add(new LightbulbPlanet	(baseUnit * 8,		baseUnit * .5,	 .75,	0, 0.5));	//03
			planets.add(new DonutPlanet		(baseUnit * 7,		baseUnit * 3,	 .75,	0));		//04
			planets.add(new DonutPlanet		(baseUnit * 7,		baseUnit * -2,	 .75,	0));		//05
			planets.add(new HomePlanet		(baseUnit * 10,		baseUnit * 0,	 1,		0, 1.25));	//06
			/*planets.add(new SpongePlanet	(baseUnit * 8,		baseUnit * 4,	.5,		0));		//07
			planets.add(new DonutPlanet		(baseUnit * 12,		baseUnit * 4.2,	.5,		0));		//08
			planets.add(new DonutPlanet		(baseUnit * 0,		baseUnit * 5.5,	.5,		0));		//09
			planets.add(new LightbulbPlanet	(baseUnit * 4.5,	baseUnit * 5.2,	.5,		0));		//10
			planets.add(new LightbulbPlanet	(baseUnit * 12,		baseUnit * 6,	.5,		0));		//11
			planets.add(new SpongePlanet	(baseUnit * 2,		baseUnit * 7,	.5,		0));		//12
			planets.add(new DonutPlanet		(baseUnit * 6,		baseUnit * 6.6,	.5,		0));		//13
			planets.add(new DonutPlanet		(baseUnit * 10,		baseUnit * 6.8,	.5,		0));		//14
			planets.add(new HomePlanet		(baseUnit * 14,		baseUnit * 7.5,	.5,		0));		//15 */
			
			/*planets.add(new SpongePlanet(-500, 2160, 2, 45, 20));
			planets.add(new LightbulbPlanet(650, 1860, .25, 0));
			planets.add(new LightbulbPlanet(600, 1960, .25, 0));
			planets.add(new LightbulbPlanet(650, 2060, .25, 0));*/
			
			/*planets.add(new DonutPlanet(400, 1760, .5, 0, 4));
			planets.add(new DonutPlanet(800, 2060, .5, 0, 4));
			planets.add(new DonutPlanet(1100, 1660, .5, 0, 4));
			planets.add(new DonutPlanet(1400, 1360, .5, 0, 4));*/
			
		}
		
	}

}