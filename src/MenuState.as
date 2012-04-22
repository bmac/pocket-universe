package
{
	import levels.Level01;
	import levels.Level02;
	import levels.Level03;
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		private var level1Button:FlxButton;
		private var level2Button:FlxButton;
		private var level3Button:FlxButton;
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
			
			level3Button = new FlxButton(0, 40, "Level 3", startLevel3);
			add(level3Button);
			
			devButton = new FlxButton(0, 60, "Dev Mode", devGame);
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
		
		private function startLevel3():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new Level03);
		}
		
		private function devGame():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new DevState);
		}
	}
}