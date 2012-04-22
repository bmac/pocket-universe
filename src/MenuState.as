package
{
	import levels.Level01;
	import levels.Level02;
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		private var level1Button:FlxButton;
		private var level2Button:FlxButton;
		private var devButton:FlxButton;

		public function MenuState()
		{
		}

		override public function create():void
		{
			FlxG.mouse.show();
			level1Button = new FlxButton(0, 0, "Level 1", startLevel1);
			add(level1Button);
			
			level2Button = new FlxButton(0, 20, "Level 2", startLevel2);
			add(level2Button);
			
			devButton = new FlxButton(0, 40, "Dev Mode", devGame);
			add(devButton);
		}
		
		private function startLevel1():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new Level01);
		}
		
		private function startLevel2():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new Level02);
		}
		
		private function devGame():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new DevState);
		}
	}
}