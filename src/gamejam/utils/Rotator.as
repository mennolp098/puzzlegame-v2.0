package gamejam.utils {
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	public class Rotator {
		public static const DIRECTION_LEFT:int = 1;
		public static const DIRECTION_RIGHT:int = -1;
		
		private static const DELAY:int = 10;
		
		private var _timer:Timer;
		
		private var _oldPosition:Point;
		private var _newPosition:Point;
		
		private var _radians:Number;
		private var _degrees:Number;
		private var _radius:Number;
		
		private var _direction:int;
		
		private var _complete:Boolean;
		
		public function Rotator(position:Point, radius:Number, degrees:Number, direction:int) {
			this._oldPosition = position;
			this._radius = radius;
			this._degrees = degrees;
			this._direction = direction;
			
			_newPosition = position;
			
			_timer = new Timer(DELAY, 90);
			
			_timer.addEventListener(TimerEvent.TIMER, function(e:TimerEvent):void {
				_degrees = _degrees + 1 * _direction;
				_radians = _degrees * (Math.PI / 180);
				
				_newPosition.x = (Math.sin(_radians) * _radius) + Main.stageCenter.x;
				_newPosition.y = (Math.cos(_radians) * _radius) + Main.stageCenter.y;
			});
			
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(e:TimerEvent):void {
				_complete = true;
			});
			
			_timer.reset();
			_timer.start();
		}
		
		public function getNewPosition():Point {
			return _newPosition;
		}
		
		public function isComplete():Boolean {
			return _complete;
		}
	}
}