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
			//This is a simple first level to try to introduce the player to the mechanics
			//each planet is visible from the previous one
			
			planets.add(new SpongePlanet(350, 350, 0.5, 1));
			planets.add(new DonutPlanet(800, 800, 1));			
			planets.add(new LightbulbPlanet(1300, 600, .75));
			planets.add(new DonutPlanet(1300, 1000, .75));
			planets.add(new DonutPlanet(1800, 900, 1));
			planets.add(new HomePlanet(2300, 800, 0.75));
			
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