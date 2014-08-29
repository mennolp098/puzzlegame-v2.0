package gamejam {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import gamejam.object.GameObject;
	import gamejam.world.Level;
	
	public class RotationManager {
		private static const _keyCodes:Array = [89, 85, 73, 79, 80];
		
		private static var _direction:int = -1;
		
		private static var _code:Array;
		
		private static var _currentKeyIndex:int;
		
		public static function generate():void {
			_code = [];
			_currentKeyIndex = 0;
			
			for(var i:int = 0; i < _keyCodes.length; i++)
				_code[i] = _keyCodes[Math.floor(Math.random() * _keyCodes.length)];
			
			trace(	String.fromCharCode(_code[0]),
					String.fromCharCode(_code[1]),
					String.fromCharCode(_code[2]),
					String.fromCharCode(_code[3]),
					String.fromCharCode(_code[4]));
		}
		
		public static function handleKeyPress(e:KeyboardEvent):void {
			if(e.keyCode == _code[_currentKeyIndex]) {
				_currentKeyIndex++;
				
				if(_currentKeyIndex == _code.length)
					Level.rotate(_direction);
			} else {
				_currentKeyIndex = 0;
			}
		}
		
		public static function swapDirection():void {
			_direction = -_direction;
		}
	}
}