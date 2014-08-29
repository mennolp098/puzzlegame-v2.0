package gamejam {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import gamejam.object.GameObject;
	
	public class RotationManager {
		private static const _keyCodes:Array = [89, 85, 73, 79, 80];
		
		private static var _direction:int = -1;
		
		private static var _code:Array;
		
		private static var _currentKeyIndex:int;
		
		public static function generate():void {
			_code = [];
			_currentKeyIndex = 0;
			
			for(var i:int = 0; i < _keyCodes.length; i++) {
				_code[i] = _keyCodes[Math.floor(Math.random() * _keyCodes.length)];
				trace(String.fromCharCode(_code[i]));
			}
		}
		
		public static function handleKeyPress(e:KeyboardEvent):void {
			if(e.keyCode == _code[_currentKeyIndex]) {
				_currentKeyIndex++;
			} else {
				_currentKeyIndex = 0;
			}
		}
		
		public static function complete():Boolean {
			return _currentKeyIndex == _code.length;
		}
		
		public static function swapDirection():void {
			_direction = -_direction;
		}
		
		public static function getRotationDirection():int {
			return _direction;
		}
	}
}