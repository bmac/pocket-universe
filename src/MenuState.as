package
{
	import levels.*;
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		private var title:FlxText = new FlxText(200, 10, 500, "Pocket Universe");	
		private var levelTutorialButton:FlxButton;
		private var level1Button:FlxButton;
		private var level2Button:FlxButton;
		private var level3Button:FlxButton;
		
		private var devTutorialButton:FlxButton;
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
			
			levelTutorialButton = new FlxButton(0, 0, "Tutorial", startLevelTutorial);
			add(levelTutorialButton);
			
			level1Button = new FlxButton(0, 20, "Level 1", startLevel1);
			add(level1Button);
			
			level2Button = new FlxButton(0, 40, "Level 2", startLevel2);
			add(level2Button);
			
			level3Button = new FlxButton(0, 60, "Level 3", startLevel3);
			add(level3Button);
			
			devTutorialButton = new FlxButton(100, 0, "Dev Tutorial", devLevelTutorial);
			add(devTutorialButton);
			
			devLevel1Button = new FlxButton(100, 20, "Dev Level 1", devLevel01);
			add(devLevel1Button);
			
			devLevel2Button = new FlxButton(100, 40, "Dev Level 2", devLevel02);
			add(devLevel2Button);
			
			devLevel3Button = new FlxButton(100, 60, "Dev Level 3", devLevel03);
			add(devLevel3Button);
			
			title.setFormat(null, 40, 0xFF00FF, "center");
			add(title);
			
			add(new FlxButton(0, 80, "Credits", gotoCredits));
			
			// start the music
			music = new MusicController();
		}
		
		private function startLevelTutorial():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new LevelTutorial);
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
		
		private function devLevelTutorial():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new DevTutorial);
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
		
		private function gotoCredits():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new CreditsState);
		}
	}
}