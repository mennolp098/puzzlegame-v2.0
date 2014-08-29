package gamejam.world {
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import gamejam.object.Lever;
	
	public class Level {
		public static const GRAVITY:int = 15;
		
		private static var _level:MovieClip;
		private static var _spikes:MovieClip;
		private static var _lever:Lever;
		
		private static var _timer:Timer;
		
		private static var _rotating:Boolean;
		private static var _rotateInit:Boolean;
		
		public static function create(levelId:int):void {
			if(_level != null)
				Main.instance.removeChild(_level);
			
			switch(levelId) {
			case 1:
				_level = new level01();
				_lever = new Lever(200, 625);
				_spikes = new spikes01();
				break;
			default:
				trace("Level " + levelId + " doesn't exist");
				return;
			}
			
			Main.instance.addChild(_level);
			_level.x = 360;
			_level.y = 360;
			Main.instance.addChild(_spikes);
		}
		
		public static function update():void {
			_lever.update();
		}
		
		public static function rotate(direction:int):void {
			if(_timer != null && _timer.running)
				return;
				
			_timer = new Timer(10, 90);
			
			_lever.rotate(direction);
			
			_timer.addEventListener(TimerEvent.TIMER, function(e:TimerEvent):void {
				_level.rotation -= direction;
			});
			
			_timer.start();
		}
		
		public static function getLevel():MovieClip {
			return _level;
		}
		
		public static function getLever():MovieClip {
			return _lever._movieClip;
		}
		
		public static function getSpikes():MovieClip {
			return _spikes;
		}
	}
}