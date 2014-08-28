package gamejam
{
	import flash.display.Sprite;
	import gamejam.object.entity.EntityPlayer;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import gamejam.object.entity.EntityPlayer;
	import gamejam.object.platform.Platform;
	import gamejam.world.Background;
	import org.flashdevelop.utils.TraceLevel;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Game
	{
		//game setup
		private var _player:EntityPlayer;
		private var _background:Background;
		private var _platform:Platform;
		private var _lever:enemy;
		
		//vars for rotation
		private var _radians:Number = 0;
		private	var _degrees:Number = 0;
		private	var _pos_x:Number = 400; // random primary x position
		private	var _pos_y:Number = 400; // random primary y position
		private	var _radius:Number = 100;
		private var _myIndetifier:Timer;
		private var _degreesCounter:Number = 0;
		private var _firstTime:Boolean;
		private var _rotateVal:Number = 1;
		
		public function Game() 
		{
			_player = new EntityPlayer(new Point(100, 100));
			_background = new Background();
			_platform = new Platform();
			_lever = new enemy();
			
			Main.instance.addChild(_background);
			Main.instance.addChild(_platform);
			Main.instance.addChild(_lever);
			
			_platform.x = 400;
			_platform.y = 400;
			Main.instance.addEventListener(Event.ENTER_FRAME, loop);
		}
		private function loop(e:Event):void
		{	
			_player.update();
			collisionChecker();
			_firstTime = true;
			_myIndetifier = new Timer(10, 90);
			_myIndetifier.addEventListener(TimerEvent.TIMER, levelRotation);
			/*if (_player.platformRotate) {
				_player.platformRotate = false;
				_player.onCollision = false;
				_myIndetifier.start();
			} 
			if (_degreesCounter == 90) {
				_degreesCounter = 0;
				_player.onCollision = true;
				_firstTime = true;
				_myIndetifier.reset();
			}*/
		}
		private function leverPulling():void
		{
			if(_rotateVal == 1){
				_rotateVal = -1;
			}
			else
			{
				_rotateVal = 1;
			}
		}
		private function collisionChecker():void 
		{
			while (_platform.hitTestPoint(_player._movieClip.x, _player._movieClip.y - _player._movieClip.height/2)) 
			{
				_player._movieClip.y++;
				_player._onGround = true;
				trace("hitting");
				trace(_player._movieClip.x);
				trace(_player._movieClip.y);
			}
			if (_platform.hitTestPoint(_player._movieClip.x, _player._movieClip.y + _player._movieClip.height / 2)) 
			{
				//TO DO: Jumpforce = 0;
			}
			if (!_platform.hitTestObject(_player._movieClip))
			{
				_player._onGround = false;
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
			_degrees = _degrees + 1 * _rotateVal; // each time degrees is increased by 1 degrees
			_radians = _degrees * Math.PI/ 180;
			var new_y:Number = Math.sin(_radians) * _radius // because sin A = y/r
			var new_x:Number = Math.cos(_radians) * _radius // because cos A = x/r
			_player.x = new_x + _pos_x;
			_player.y = new_y + _pos_y;
			
			//_level.rotation += 1 * _rotateVal;
			
			_degreesCounter++;
		}
	}

}