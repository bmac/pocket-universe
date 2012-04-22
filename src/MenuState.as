package
{
	import levels.*;
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		private var level1Button:FlxButton;
		private var level2Button:FlxButton;
		private var level3Button:FlxButton;
		private var level4Button:FlxButton;
		
		private var devLevel1Button:FlxButton;
		private var devLevel2Button:FlxButton;
		private var devLevel3Button:FlxButton;

		private var music:MusicController;
		
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
			
			level4Button = new FlxButton(0, 60, "Level 4", startLevel4);
			add(level4Button);
			
			
			devLevel1Button = new FlxButton(100, 0, "Dev Level 1", devLevel01);
			add(devLevel1Button);
			
			devLevel2Button = new FlxButton(100, 20, "Dev Level 2", devLevel02);
			add(devLevel2Button);
			
			devLevel3Button = new FlxButton(100, 40, "Dev Level 3", devLevel03);
			add(devLevel3Button);
			
			// start the music
			music = new MusicController();
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
		
		private function startLevel4():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new Level04);
		}
		
		private function devLevel01():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new DevLevel01);
		}
		
		private function devLevel02():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new DevLevel02);
		}
		
		private function devLevel03():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new DevLevel03);
		}
	}
}