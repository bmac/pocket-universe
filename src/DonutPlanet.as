package  
{
	/**
	 * ...
	 * @author Chris
	 */
	public class DonutPlanet extends Planet 
	{
		public const DONUT_MASS:int = 1;
		
		// add donut sprite
		
		public function DonutPlanet(x:int, y:int, checkpoint:int) 
		{
			super(x, y, checkpoint);
			this._mass = DONUT_MASS;
		}
		
	}

}