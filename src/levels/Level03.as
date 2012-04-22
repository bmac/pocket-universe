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
		override public function CreatePlanets(planets:FlxGroup):void 
		{
			// create all the planets for the level
			
			planets.add(new SpongePlanet(350, 350, 0.5, 1));
			planets.add(new DonutPlanet(900, 50, 0.5, 1));
			planets.add(new DonutPlanet(150, 900, 0.5));
			planets.add(new LightbulbPlanet(900, 900, 0.5));
			planets.add(new SpongePlanet(1300, 900, 1, 1));
			planets.add(new HomePlanet(1300, 1300, 0.5));
			
			
		}
		
		override public function update():void
		{
			super.update();
			if (player.getSuccess())
			{
				//TODO: Determine what to do about win condition...
				FlxG.switchState(new Level01());
			}
		}
		
	}

}