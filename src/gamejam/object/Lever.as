package gamejam.object {
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import gamejam.utils.Rotator;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import gamejam.world.Level;
	
	public class Lever extends GameObject {
		private var _timer:Timer;
		
		public function Lever(x:int, y:int) {
			super(new lever(), new Point(x, y));
			
			_timer = new Timer(10, 90);
			
			_timer.addEventListener(TimerEvent.TIMER, function(e:TimerEvent):void {
				switch(_rotateDirection) {
				case Rotator.DIRECTION_LEFT:
					_movieClip.rotation--;
					break;
				case Rotator.DIRECTION_RIGHT:
					_movieClip.rotation++;
					break;
				}
			});
			
			_movieClip.gotoAndStop(1);
		}
		
		public override function update():void {
			super.update();
			
			if(isRotating() && !_timer.running)
				_timer.start();
		}
	}
}