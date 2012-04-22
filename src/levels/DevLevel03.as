package levels 
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author ...
	 */
	public class DevLevel03 extends DevState 
	{
		private const baseUnit:int = DonutPlanet.DEFAULT_SIZE / 2;
		
		public function DevLevel03() 
		{
			
		}
		
		override public function CreatePlanets(planets:FlxGroup):void 
		{
			// populate universe with planets here
			
			/* planets in order:
				 * 00: (-1,		-1)		sponge [double size]
				 * 01: (2,		0)		donut
				 * 02: (4,		0)		donut
				 * 03: (6,		0)		donut
				 * 04: (8,		0)		sponge
				 * 05: (8,		1.5)	donut
				 * 06: (8,		2.5)	donut
				 * 07: (8,		3.5)	donut
				 * 08: (8,		4.5)	donut
				 * 09: (6,		2)		donut
				 * 10: (6,		3)		donut
				 * 11: (6,		4)		donut
				 * 12: (9,		6)		sponge
				 * 13: (11,		5)	HOME
				 * 14: 
				 * 15: 
			*/
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
			planets.add(new DonutPlanet		(baseUnit * 15.5,	baseUnit * 8,	.5,		0, 18));	//13
			
			planets.add(new LightbulbPlanet	(baseUnit * 10,		baseUnit * 3,	.5,		0));		//14
			planets.add(new LightbulbPlanet	(baseUnit * 3,		baseUnit * 3,	.5,		0));		//15
			planets.add(new LightbulbPlanet	(baseUnit * 4,		baseUnit * -2,	.5,		0));		//16
			planets.add(new LightbulbPlanet	(baseUnit * 4.5,	baseUnit * 1.5,	.5,		0));		//17
			planets.add(new LightbulbPlanet	(baseUnit * 3.75,	baseUnit * 2.25, .5,		0));	//18
			planets.add(new LightbulbPlanet	(baseUnit * 11.25,	baseUnit * 6.5,	.5,		0, 2));		//19
			
			
			
			/*planets.add(new DonutPlanet		(baseUnit * 10,		baseUnit * 6.8,	.5,		0));		//14
			planets.add(new HomePlanet		(baseUnit * 14,		baseUnit * 7.5,	.5,		0));		//15*/
			
		}
		
	}

}