package  
{
	/**
	 * ...
	 * @author Chris
	 */
	public class IcePlanet extends Planet 
	{
		
		
		
		public function IcePlanet(x:int, y:int, checkpoint:int) 
		{
			super(x, y, checkpoint);
			
		}
		
		override public function playerCollision(player:Player):void 
		{
			super(player);
			player.freeze();
		}
		
	}

}