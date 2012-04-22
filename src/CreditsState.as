package  
{
	import org.flixel.*
	/**
	 * ...
	 * @author 
	 */
	public class CreditsState extends FlxState
	{
		
		private var level1Button:FlxButton;

		private var music:MusicController;
		
		private var player:FlxSprite;
		
		public function CreditsState() 
		{
			
		}
		
		override public function create():void
		{
			FlxG.mouse.show();
			add(new FlxButton(430, 70, "Go To Menu", gotoMenu));
			
			add(createText(100, 100, "Programming:"));
			add(createText(100, 170, "Jonathan Rubinger"));
			add(createText(100, 220, "Vinny DaSilva"));
			add(createText(100, 270, "Chris Embree"));
			add(createText(100, 320, "Brendan McLoughlin"));
			
			
			
			add(createText(450, 100,"Art:"));
			add(createText(700, 170, "Breeze"));
			add(createText(700, 170, "Emily"));

			
			add(createText(700, 100,"Audio:"));
			add(createText(700, 170, "Jonathan Rubinger"));

			
			
			// start the music
			music = new MusicController();
			
		}
		
		private function gotoMenu():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new MenuState);
		}
		
		private function createText(x:int, y:int, text:String):FlxText
		{
			var ret:FlxText = new FlxText(x, y, 200, text);
			ret.setFormat(null, 16);
			return ret;
		}
		
	}

}