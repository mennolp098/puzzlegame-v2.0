package gamejam.object {
	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.geom.Point;
	import gamejam.utils.Rotator;
	import gamejam.world.Level;
	
	public class GameObject {
		public var _movieClip:MovieClip;
		
		private var _rotator:Rotator;
		
		private var _rotateCodeCorrect:Boolean;
		
		private var _rotationStart:int;
		protected var _rotateDirection:int;
		
		private var _rotating:Boolean;
		
		public function GameObject(movieClip:MovieClip, position:Point) {
			_movieClip = movieClip;
			
			_movieClip.x = position.x;
			_movieClip.y = position.y;
			
			_rotateDirection = 0;
			
			Main.instance.addChild(_movieClip);
		}
		
		public function update():void {
			if(!_rotateCodeCorrect) {
				checkForCollision();
			} else {
				handleSceneRotation();
			}
		}
		
		public function rotate():void {
			_rotateCodeCorrect = true;
		}
		
		protected function checkForCollision():void {}
		
		private function handleSceneRotation():void {
			if(!_rotating)
				initSceneRotation();
			
			_movieClip.x = _rotator.getNewPosition().x;
			_movieClip.y = _rotator.getNewPosition().y;
			
			if(_rotator.isComplete()) {
				_rotating = false;
				//_rotateDirection = 0;
				_rotateCodeCorrect = false;
			}
		}
		
		private function initSceneRotation():void {
			var position:Point = new Point(_movieClip.x, _movieClip.y);
			
			var radius:Number = position.subtract(Main.stageCenter).length;
			var angle:Number = Math.atan2(_movieClip.y - Main.stageCenter.x, _movieClip.x - Main.stageCenter.y);
			var degrees:Number = angle * 180 / Math.PI;
			
			_rotator = new Rotator(new Point(_movieClip.x, _movieClip.y), radius, degrees, _rotateDirection);
			_rotating = true;
			
			Level.rotate(_rotateDirection);
		}
		
		public function isRotating():Boolean {
			return _rotating;
		}
		
		public function setRotateDirection(direction:int):void {
			this._rotateDirection = direction;
		}
	}
}
