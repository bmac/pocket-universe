package
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		private var startButton:FlxButton;
		private var devButton:FlxButton;

		public function MenuState()
		{
		}

		override public function create():void
		{
			FlxG.mouse.show();
			startButton = new FlxButton(0, 0, "Start Game", startGame);
			add(startButton);
			
			devButton = new FlxButton(0, 20, "Dev Mode", devGame);
			add(devButton);
		}

		private function startGame():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new PlayState);
		}
		
		private function devGame():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new DevState);
		}
	}
}