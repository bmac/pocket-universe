package  
{
	/**
	 * ...
	 * @author Chris
	 */
	public class Soda extends Obstacle 
	{
		
		public function Soda(x:int, y:int) 
		{
			super(x,y);
		}
		
		override public function update():void
		{
			do_animation();
			super.update();
		}
		
		override public function do_animation():void
		{
			// insert soda animation
		}
		
		public function playerCollision(player:Player):void
		{
			
		}
	}

}