package levels 
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author ...
	 */
	public class DevLevel02 extends DevState 
	{
		
		public function DevLevel02() 
		{
			
		}
		
		override public function CreatePlanets(planets:FlxGroup):void 
		{
			// populate universe with planets here
			planets.add(new SpongePlanet(0, 0, 2, 45, 20));
			//planets.add(new DonutPlanet(
			
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