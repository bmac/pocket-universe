package  
{
	import flash.geom.Point;
	import org.flixel.*;
	/**
	 * ...
	 * @author Chris
	 */
	public class DevCamera extends FlxCamera
	{
		
		public function DevCamera() 
		{
			super(0, 0, 640, 480, 1);			
		}
		
		override public function update():void
		{
			do_input();
			super.update();		
		}
		
		public function do_input():void
		{
			if (FlxG.keys.A)
			{
				if (x > 10)
				{
					x = x - 10;
				}
			}
			if (FlxG.keys.D)
			{
				if (x < (1000 - 10 - 640)) // world width minus 10 minus frame width
				{
					x = x + 10;
				}
			}
			if (FlxG.keys.W)
			{
				if (y < (1000 - 10 - 480)) // world height minus 10 minus frame height
				{
					y = y + 10;
				}
			}
			if (FlxG.keys.S)
			{
				if (y > 10)
				{
					y = y - 10;
				}
			}
		}
	}

}