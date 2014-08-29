package gamejam.object {
	import flash.geom.Point;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import gamejam.utils.Rotator;
	
	public class Door extends GameObject {
		private var _timer:Timer;
		
		public function Door(x:int, y:int, rotation:Number) {
			super(new door(), new Point(x, y));
			
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
			
			if(isRotating() && !_timer.running) {
				_timer.reset();
				_timer.start();
			}
		}
		
		public function open():void {
			_movieClip.gotoAndPlay(2);
		}
	}
}