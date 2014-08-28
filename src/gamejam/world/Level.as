package gamejam.world {
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Level {
		public static const GRAVITY:int = 15;
		
		private static var _level:MovieClip;
		
		private static var _timer:Timer;
		
		private static var _rotating:Boolean;
		private static var _rotateInit:Boolean;
		
		public static function create(levelId:int):void {
			if(_level != null)
				Main.instance.removeChild(_level);
			
			switch(levelId) {
			case 1:
				_level = new platform();
				break;
			default:
				trace("Level " + levelId + " doesn't exist");
				return;
			}
			
			_level.x = Main.stageCenter.x;
			_level.y = Main.stageCenter.y;
			
			Main.instance.addChild(_level);
		}
		
		public static function rotate(direction:int):void {
			_timer = new Timer(10, 90);
			
			_timer.addEventListener(TimerEvent.TIMER, function(e:TimerEvent):void {
				_level.rotation -= direction;
			});
			
			_timer.start();
		}
		
		public static function getLevel():MovieClip {
			return _level;
		}
	}
}