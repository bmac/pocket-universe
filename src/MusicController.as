package  
{
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import org.flixel.FlxTimer;
	
	/**
	 * ...
	 * @author JR
	 */
	public class MusicController extends FlxBasic 
	{
		//private var eventTimer:FlxTimer = new FlxTimer();
		private var eventTimer:Timer;
		[Embed(source = "../assets/audio/chords.mp3")] 	public var chords:Class;
		
		[Embed(source = "../assets/audio/incidental_1.mp3")] 	public var inc_1:Class;
		[Embed(source = "../assets/audio/incidental_2.mp3")] 	public var inc_2:Class;
		[Embed(source = "../assets/audio/incidental_3.mp3")] 	public var inc_3:Class;
		[Embed(source = "../assets/audio/incidental_4.mp3")] 	public var inc_4:Class;
		[Embed(source = "../assets/audio/incidental_5.mp3")] 	public var inc_5:Class;
		[Embed(source = "../assets/audio/incidental_6.mp3")] 	public var inc_6:Class;
		[Embed(source = "../assets/audio/incidental_7.mp3")] 	public var inc_7:Class;
		[Embed(source = "../assets/audio/incidental_8.mp3")] 	public var inc_8:Class;
		private var incidentals:Array =  new Array(inc_1, inc_2, inc_3, inc_4, inc_5, inc_6, inc_7, inc_8);
		
		private var incidentalDelayMin:int = 7;
		private var incidentalDelayMax:int = 10;
		private var lastIncidental:int = 999;
		
		public function MusicController() 
		{
			FlxG.debug = true;
			//eventTimer.start(2, 1, this.fireIncidental);
			eventTimer = new Timer(2000, 1);
			eventTimer.start();
			eventTimer.addEventListener(TimerEvent.TIMER_COMPLETE, fireIncidental);

			FlxG.playMusic(chords);
		}
		
		public function fireIncidental(e:TimerEvent):void
		{
			var nextIncidental:int;
			do
			{
				nextIncidental = randomMinMax(0, incidentals.length - 1);
			} while (nextIncidental == lastIncidental);
			FlxG.play(incidentals[nextIncidental], 0.6);
			lastIncidental = nextIncidental;

			eventTimer.stop();
			//eventTimer.start(randomMinMax(incidentalDelayMin, incidentalDelayMax), 1, this.fireIncidental);
			eventTimer = new Timer(randomMinMax(incidentalDelayMin, incidentalDelayMax) * 1000, 1);
			eventTimer.start();
			eventTimer.addEventListener(TimerEvent.TIMER_COMPLETE, fireIncidental);
		}
		
		private function randomMinMax(min:int, max:int):int
		{
			return Math.floor(min + ( max - min ) * Math.random());
		}
		
		override public function update():void
		{
			
		}
	}

}