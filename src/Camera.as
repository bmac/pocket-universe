package  
{
	import org.flixel.FlxCamera;
	import org.flixel.FlxPoint;
	
	/**
	 * ...
	 * @author Chris
	 */
	public class Camera extends FlxCamera 
	{
		
		public function Camera(point:FlxPoint, Width:int, Height:int, Zoom:Number=0) 
		{
			super(point.x, point.y, Width, Height, Zoom);	
		}
		
		public function moveTo(point:FlxPoint):void
		{
			this.x = point.x;
			this.y = point.y;
		}
		
		public function worldPositionToScreenPosition (point:FlxPoint):FlxPoint
		{
			return (new FlxPoint((point.x - this.x), (point.y - this.y)));
		}
		
		
	}

}