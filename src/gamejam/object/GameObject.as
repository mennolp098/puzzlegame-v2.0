package gamejam.object {
	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.geom.Point;
	import gamejam.utils.Rotator;
	
	public class GameObject extends MovieClip {
		public var _movieClip:MovieClip;
		
		private var _rotator:Rotator;
		
		private var _rotationStart:int;
		
		private var _hasToRotate:Boolean;
		private var _rotating:Boolean;
		
		public function GameObject(movieClip:MovieClip, position:Point, rotation:Number) {
			_movieClip = movieClip;
			
			_movieClip.x = position.x;
			_movieClip.y = position.y;
			_movieClip.rotation = rotation;
			
			_rotationStart = 0;
			_hasToRotate = false;
			
			Main.instance.addChild(_movieClip);
		}
		
		public function update():void {
			if(!_hasToRotate) {
				checkForCollision();
			} else {
				handleSceneRotation();
			}
		}
		
		private function checkForCollision():void {
			// TODO
		}
		
		private function handleSceneRotation():void {
			if(!_rotating)
				initSceneRotation();
			
			// TODO
			
			if(_movieClip.rotation >= (_movieClip.rotation + _rotationStart)) {
				_movieClip.rotation = (_movieClip.rotation + _rotationStart);
				_rotating = false;
				_hasToRotate = false;
			}
		}
		
		private function initSceneRotation():void {
			_rotationStart = _movieClip.rotation;
			
			var position:Point = new Point(_movieClip.x, _movieClip.y);
			var stageCenter:Point 
		//	var radius:Number = position.subtract(
			
			//_rotator = new Rotator(new Point(_movieClip.x, _movieClip.y), );
			
			_rotating = true;
		}
	}
}
/*
public function levelRotation(e:TimerEvent):void 
		{
			if (_firstTime) {
				_firstTime = false;
				
				var playerpos:Point = new Point(_player.x, _player.y);
				var centerpos:Point = new Point(400, 400);
				
				_radius = playerpos.subtract(centerpos).length;
				
				var angle:Number = Math.atan2(_player.y-400,_player.x-400);
				_degrees = angle * 180/ Math.PI;
			}
			_degrees = _degrees + 1 * _rotateVal; // each time degrees is increased by 1 degrees
			_radians = _degrees * Math.PI/ 180;
			var new_y:Number = Math.sin(_radians) * _radius // because sin A = y/r
			var new_x:Number = Math.cos(_radians) * _radius // because cos A = x/r
			_player.x = new_x + _pos_x;
			_player.y = new_y + _pos_y;
			
			_level.rotation += 1 * _rotateVal;
			
			_degreesCounter++;
		}*/