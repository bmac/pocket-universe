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
			
			planets.add(new SpongePlanet(-500, 2160, 2, 45, 20));
			/*planets.add(new LightbulbPlanet(650, 1860, .25, 0));
			planets.add(new LightbulbPlanet(600, 1960, .25, 0));
			planets.add(new LightbulbPlanet(650, 2060, .25, 0));*/
			
			planets.add(new DonutPlanet(400, 1760, .5, 0, 4));
			planets.add(new DonutPlanet(800, 2060, .5, 0, 4));
			planets.add(new DonutPlanet(1100, 1660, .5, 0, 4));
			planets.add(new DonutPlanet(1400, 1360, .5, 0, 4));
			
			/*planets.add(new LightbulbPlanet(20, 20, .75));
			planets.add(new DonutPlanet(800, 800, 1));
			planets.add(new HomePlanet(200, 800, 0.75));*/
			
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
				FlxG.switchState(new Level03());
			}
		}
	}

}