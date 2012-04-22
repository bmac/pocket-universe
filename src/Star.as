package 
{
	import org.flixel.*;

	public class Star extends FlxSprite
	{

		[Embed(source="../assets/star.png")]private var star_img:Class;

		public function Star()
		{
			super();
			loadGraphic(star_img, true, false, 8, 8);
		}

		// Instead of using the constructor to position the stars we'll do it separately
		public function spawn(x:int, y:int) : void
		{
			this.x = x;
			this.y = y;
			frame = Math.random() * 3; // Choose a random frame

			// The downwards velocity is based on the size
			//velocity.y = (frame * 10) + 20 + Math.random() * 0;
			// Random transparency
			alpha = 0.25 * Math.random() + 0.25;
		}

		override public function update():void
		{
			// Respawn it when it goes offscreen
			if (y > FlxG.height)
			{
				y = -8;
				spawn(Math.random() * FlxG.width, -8);
			}
			super.update();
		}

	}
}