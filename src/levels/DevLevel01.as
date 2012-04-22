package levels 
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author ...
	 */
	public class DevLevel01 extends DevState 
	{
		
		public function DevLevel01()
		{
			
		}
		
		override public function CreatePlanets(planets:FlxGroup):void 
		{
			// populate universe with planets here
			planets.add(new SpongePlanet(350, 350, 0.5, 1));
			planets.add(new DonutPlanet(900, 50, 0.5, 1));
			planets.add(new DonutPlanet(150, 900, 0.5));
			planets.add(new DonutPlanet(1000, 1400, 0.5));
			planets.add(new LightbulbPlanet(900, 900, 0.5));
			planets.add(new LightbulbPlanet(1200, 600, 0.75));
			planets.add(new LightbulbPlanet(1600, 530, 0.5));
			planets.add(new LightbulbPlanet(1300, 1500, 0.5));
			planets.add(new LightbulbPlanet(1250, 1700, 0.5));
			planets.add(new SpongePlanet(1300, 900, 1, 1));
			planets.add(new HomePlanet(1300, 2000, 0.5));
			
		}
		
	}

}