package levels 
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author ...
	 */
	public class DevLevel02 extends DevState 
	{
		private const baseUnit:int = DonutPlanet.DEFAULT_SIZE / 2;
		
		public function DevLevel02() 
		{
			
		}
		
		override public function CreatePlanets(planets:FlxGroup):void 
		{
			// populate universe with planets here
			/*planets.add(new SpongePlanet(0, 0, 1.5, 45, 20));
			planets.add(new DonutPlanet(900, -400, .5, 0))
			planets.add(new DonutPlanet(1300, 0, .5, 0))
			planets.add(new DonutPlanet(1700, -200, .5, 0))*/
			
			
			/* planets in order:
				 * (5,0) donut
				 * (7.5, 0.5) sponge
				 * (11.5, 1) donut
				 * (1, 3) donut
				 * (5, 2.5) donut
				 * (9.75, 2) lightbulb
				 * 
			*/
			
			planets.add(new DonutPlanet(baseUnit * 5, 0, .5, 0));
			planets.add(new DonutPlanet(baseUnit * 1, baseUnit * 3, .5, 0));
			
			//
			
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