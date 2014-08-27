package  
{
	import flash.display.Sprite;
	import org.flashdevelop.utils.TraceLevel;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Game extends Sprite
	{
		//game setup
		private var _player:Player;
		private var _background:Background;
		private var _level:Level;
		
		//vars for rotation
		private var _radians:Number = 0;
		private	var _degrees:Number = 0;
		private	var _pos_x:Number = 400; // random primary x position
		private	var _pos_y:Number = 400; // random primary y position
		private	var _radius:Number = 100;
		private var _myIndetifier:Timer;
		private var _degreesCounter:Number = 0;
		private var _firstTime:Boolean;
		
		public function Game() 
		{
			_player = new Player();
			_background = new Background();
			_level = new Level();
			
			addChild(_player);
			addChild(_background);
			addChild(_level);
			
			addEventListener(Event.ENTER_FRAME, loop);
		}
		private function loop(e:Event):void
		{	
			_player.update();
			_firstTime = true;
			_myIndetifier = new Timer(10, 90);
			_myIndetifier.addEventListener(TimerEvent.TIMER, levelRotation);
			if (_player.platformRotate) {
				_player.platformRotate = false;
				_player.onCollision = false;
				_myIndetifier.start();
			}
			if (_derpcounter == 90) {
				_derpcounter = 0;
				_player.onCollision = true;
				_firstTime = true;
				_myIndetifier.reset();
			}
		}
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
			_degrees = _degrees + 1 * -1; // each time degrees is increased by 1 degrees
			_radians = _degrees * Math.PI/ 180;
			var new_y:Number = Math.sin(_radians) * _radius // because sin A = y/r
			var new_x:Number = Math.cos(_radians) * _radius // because cos A = x/r
			_player.x = new_x + pos_x;
			_player.y = new_y + pos_y;
			
			_level.rotation += 1 * -1;
			
			_degreesCounter++;
		}
	}

}