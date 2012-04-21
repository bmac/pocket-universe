package  
{
	import org.flixel.FlxCamera;
	import org.flixel.FlxPoint;
	
	/**
	 * ...
	 * @author Chris
	 */
	public class Camera
	{
		public var x:int;
		public var y:int;
		public var Width:int;
		public var Height:int;		
		private var player:Player;
		
		private var cameraVelocity:Number = 0;
		
		public function Camera(point:FlxPoint, Width:int, Height:int, player:Player) 
		{
			this.x = point.x;
			this.y = point.y;
			this.Width = Width;
			this.Height = Height;
			this.player = player;
		}
		
		public function update():void
		{
			followPlayer();
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
		
		public function followPlayer():void 
		{
			var playerLocation:FlxPoint = worldPositionToScreenPosition(player.playerLocation());
			
			if (playerLocation.x < 100) // player moving left
			{
				this.x = this.x + playerLocation.x - 100;
			}
			if (playerLocation.x > 860) // player moving right
			{
				this.x = this.x + playerLocation.x - 860;
			}
			if (playerLocation.y < 50) // player moving up
			{
				this.y = this.y + playerLocation.y - 50;
			}
			if (playerLocation.y > 490) // player moving down
			{
				this.y = this.y + playerLocation.y - 490;
			}
		}
	}

}