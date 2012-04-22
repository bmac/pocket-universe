package levels 
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author ...
	 */
	public class DevLevel03 extends DevState 
	{
		
		public function DevLevel03() 
		{
			
		}
		
		override public function CreatePlanets(planets:FlxGroup):void 
		{
			// populate universe with planets here
			planets.add(new SpongePlanet(350, 350, 0.5, 1));
			planets.add(new HomePlanet(1300, 1500, 0.25));
			planets.add(new DonutPlanet(900, 50, 0.5, 1));
			planets.add(new DonutPlanet(150, 900, 0.5));
			planets.add(new LightbulbPlanet(900, 900, 0.5));
			planets.add(new SpongePlanet(1300, 900, 1, 1));
			
		}
		
	}

}