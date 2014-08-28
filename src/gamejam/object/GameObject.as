package gamejam.object {
	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.geom.Point;
	import gamejam.utils.Rotator;
	
	public class GameObject {
		public var _movieClip:MovieClip;
		
		private var _rotator:Rotator;
		
		private var _rotationStart:int;
		private var _rotateDirection:int;
		
		private var _rotating:Boolean;
		
		public function GameObject(movieClip:MovieClip, position:Point, rotation:Number) {
			_movieClip = movieClip;
			
			_movieClip.x = position.x;
			_movieClip.y = position.y;
			_movieClip.rotation = rotation;
			
			_rotationStart = 0;
			_rotateDirection = 0;
			
			Main.instance.addChild(_movieClip);
		}
		
		public function update():void {
			if(!_rotateDirection == 0) {
				checkForCollision();
			} else {
				handleSceneRotation();
			}
		}
		
		public function rotate(direction:int):void {
			_rotateDirection = direction;
		}
		
		private function checkForCollision():void {
			// TODO
		}
		
		private function handleSceneRotation():void {
			if(!_rotating)
				initSceneRotation();
			
			_movieClip.x = _rotator.getNewPosition().x;
			_movieClip.y = _rotator.getNewPosition().y;
			
			if(_movieClip.rotation >= (_movieClip.rotation + _rotationStart)) {
				_movieClip.rotation = (_movieClip.rotation + _rotationStart);
				_rotating = false;
				_rotateDirection = 0;
			}
		}
		
		private function initSceneRotation():void {
			_rotationStart = _movieClip.rotation;
			
			var position:Point = new Point(_movieClip.x, _movieClip.y);
			
			var radius:Number = position.subtract(Rotator.STAGE_CENTER).length;
			var angle:Number = Math.atan2(_movieClip.y - Rotator.STAGE_CENTER.x, _movieClip.x - Rotator.STAGE_CENTER.y);
			var degrees:Number = angle * 180 / Math.PI;
			
			_rotator = new Rotator(new Point(_movieClip.x, _movieClip.y), radius, degrees, Rotator.DIRECTION_RIGHT);
			_rotating = true;
		}
		
		public function isRotating():Boolean {
			return _rotating;
		}
	}
}
