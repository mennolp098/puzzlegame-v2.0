package gamejam.world {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import gamejam.object.Door;
	import gamejam.object.Lever;
	import gamejam.object.Player;
	import gamejam.RotationManager;
	import gamejam.object.Spike;
	
	public class Level {
		public static const GRAVITY:int = 15;
		
		private static var _level:MovieClip;
		private static var _background:MovieClip;
		
		private static var _player:Player;
		private static var _spike:Spike;
		private static var _lever:Lever;
		private static var _door:Door;
		
		private static var _timer:Timer;
		
		private static var _rotating:Boolean;
		private static var _rotateInit:Boolean;
		
		private static var _container:MovieClip;
		
		public static function create(levelId:int):void {
			if(_level != null)
				Main.instance.removeChild(_level);
			if(_background != null)
				Main.instance.removeChild(_background);
			if(_container == null) {
				_container = new MovieClip();
				Main.instance.addChild(_container);
			}
			
			if(_level != null) {
				if(_container.contains(_level))
					_container.removeChild(_level);
				
				if(_container.contains(_player._movieClip))
					_container.removeChild(_player._movieClip);
					
				if(_container.contains(_spike._movieClip))
					_container.removeChild(_spike._movieClip);
				
				if(_container.contains(_lever._movieClip))
					_container.removeChild(_lever._movieClip);
				
				if(_container.contains(_door._movieClip))
					_container.removeChild(_door._movieClip);
			}
			
			switch(levelId) {
			case 1:
				_level = new level01();
				_background = new back1();
				_player = new Player(250, 600);
				_lever = new Lever(125, 90, 90);
				_spike = new Spike(200, 250, 0);
				_door = new Door(150, 350, 90);
				break;
			case 2:
				_level = new level02();
				_background = new back2();
				_player = new Player(250, 500);
				_lever = new Lever(117, 50, 90);
				_spike = new Spike(0, 0, 0);
				_door = new Door(207, 290, 90);
				break;
			default:
				trace("Level " + levelId + " doesn't exist");
				return;
			}
			
			_level.x = Main.stageCenter.x
			_level.y = Main.stageCenter.y;
			
			_background.x = Main.stageCenter.x
			_background.y = Main.stageCenter.y;
			
			Main.instance.addChildAt(_background, 0);
			_container.addChild(_door._movieClip);
			_container.addChild(_lever._movieClip);
			_container.addChild(_spike._movieClip);
			_container.addChild(_player._movieClip);
			_container.addChild(_level);
		}
		
		public static function update():void {
			_player.update();
			_spike.update();
			//_lever.update();
			//_door.update();
		}
		
		public static function rotate(direction:int):void {
			if(_timer != null && _timer.running)
				return;
				
			_timer = new Timer(10, 90);
			
			_player.rotate(direction);
			_lever.rotate(direction);
			_spike.rotate(direction);
			_door.rotate(direction);
			
			_timer.addEventListener(TimerEvent.TIMER, function(e:TimerEvent):void {
				_level.rotation -= direction;
			});
			
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(e:TimerEvent):void {
				RotationManager.generate();
			});
			
			_timer.start();
		}
		
		public static function getLevel():MovieClip {
			return _level;
		}
		
		public static function getLever():MovieClip {
			return _lever._movieClip;
		}
		
		public static function getSpike():MovieClip {
			return _spike._movieClip;
		}
		
		public static function getDoor():Door {
			return _door;
		}
	}
}