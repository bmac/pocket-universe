package levels 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author Vinny
	 */
	public class Level01 extends Level
	{
		override public function CreatePlanets(planets:FlxGroup):void 
		{
			// create all the planets for the level
			
			planets.add(new SpongePlanet(350, 350, 0.5, 1));
			planets.add(new LightbulbPlanet(20, 20, .75));
			planets.add(new DonutPlanet(800, 800, 1));
			planets.add(new HomePlanet(200, 800, 0.75));
			
			planets.add(new DonutPlanet(1300, 800, 1));
			
			planets.add(new DonutPlanet(1800, 800, 1));
			
			/*planets.add(new LightbulbPlanet(800, 740, 0));
			planets.add(new LightbulbPlanet(400, 490, 0));
			planets.add(new SpongePlanet(50, 50, 1));
			planets.add(new LightbulbPlanet(100, 70, 1));
			planets.add(new LightbulbPlanet(800, 740, 0));
			planets.add(new LightbulbPlanet(200, 150, 0));
			planets.add(new SpongePlanet(50, 500, 1));
			/**/
		}
		
		override public function update():void
		{
			super.update();
			if (player.getSuccess())
			{
				//TODO: Determine what to do about win condition...
				FlxG.switchState(new Level02());
			}
		}
		
	}

}