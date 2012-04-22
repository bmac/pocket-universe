package levels 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	
	/**
	 * ...
	 * @author Vinny
	 */
	public class Level04 extends Level
	{
		
		override public function CreatePlanets(planets:FlxGroup):void 
		{
			planets.add(new SpongePlanet(50, 50, 0.5, 1));
			planets.add(new GrapePlanet(550, 550, 1.5));
			
			planets.add(new LightbulbPlanet(550, 95, .75,0, 15));
			planets.add(new LightbulbPlanet(95, 550, .75, 0, 15));
			planets.add(new LightbulbPlanet(550, 1005, .75,0, 15));
			
			
			//little lightbulbs (top row)
			planets.add(new LightbulbPlanet(750, 420, .25, 0, 0.5));
			planets.add(new LightbulbPlanet(850, 420, .25, 0, 0.5));
			planets.add(new LightbulbPlanet(950, 420, .25, 0, 0.5));
			planets.add(new LightbulbPlanet(1050, 420, .25, 0, 0.5));

			//little lightbulbs (bottom row)
			planets.add(new LightbulbPlanet(750, 620, .25, 0, 0.5));
			planets.add(new LightbulbPlanet(850, 620, .25, 0, 0.5));
			planets.add(new LightbulbPlanet(950, 620, .25, 0, 0.5));
			planets.add(new LightbulbPlanet(1050, 620, .25, 0, 0.5));
			
			
			planets.add(new DonutPlanet(1375, 520, .75,0,20));
			
			planets.add(new LightbulbPlanet(1375, 900, .75));
			planets.add(new GrapePlanet(1575, 1500, 1.5));
			
			
			planets.add(new HomePlanet(2000, 2000, 0.5));
		}
	
		override public function update():void
		{
			super.update();
			if (player.getSuccess())
			{
				FlxG.switchState(new CreditsState());
			}
		}
	}
}