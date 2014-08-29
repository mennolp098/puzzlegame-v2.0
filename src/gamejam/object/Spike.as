package gamejam.object {
	import flash.geom.Point;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import gamejam.utils.Rotator;
	
	public class Spike extends GameObject {
		private var _timer:Timer;
		
		public function Spike(x:int, y:int, rotation:Number) {
			super(new spikes01(), new Point(x, y));
			
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
			
			_movieClip.rotation = rotation;
		}
		
		public override function update():void {
			super.update();
			
			if(isRotating() && !_timer.running)
				_timer.start();
		}
	}
}