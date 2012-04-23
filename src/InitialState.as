package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author ...
	 */
	public class InitialState extends FlxState 
	{
		private var music:MusicController;
		
		public function InitialState() 
		{
			
		}

		override public function create():void
		{
			FlxG.mouse.hide();
			
			// start the music
			music = new MusicController();
		}
		
		override public function update():void
		{
			FlxG.switchState(new MenuState);
		}
		
	}

}