package gamejam.object {
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.ui.Keyboard;
	import gamejam.object.GameObject;
	import gamejam.world.Level;
	import flash.display.MovieClip;
	
	public class Player extends GameObject {
		public static const PULLLEVER:String = "pullLever";
		
		private static const DEFAULT_SPEED:int = 7;
		private static const JUMP_FORCE:int = 40;
		
		private var _velocity:Vector3D;
		
		private var _speed:int;
		private var _jumpForce:int;
		private var _gravityMultiplier:int;
		
		public var _onGround:Boolean;
		
		private var _canMoveLeft:Boolean;
		private var _canMoveRight:Boolean;
		
		public function Player(position:Point) {
			super(new mannetje(), position);
			
			_velocity = new Vector3D();
			
			_speed = DEFAULT_SPEED;
			_gravityMultiplier = 1;
			
			_onGround = false;
			
			_movieClip.gotoAndStop(1);
			
			Main.instance.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);			
			Main.instance.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function pullLever():void {
			Main.instance.dispatchEvent(new Event(PULLLEVER));
		}
		
		public override function update():void {
			_canMoveLeft = true;
			_canMoveRight = true;
			
			super.update();
			
			if(!isRotating()) {
				if(!(_velocity.x == -1 && !_canMoveLeft) || !(_velocity.x == 1 && !_canMoveRight))
					_movieClip.x += (_speed * _velocity.x);

				_movieClip.y += (_jumpForce + _velocity.y + (Level.GRAVITY * _gravityMultiplier));
				
				if(_onGround) {
					_movieClip.y -= Level.GRAVITY;
				} else {
					_movieClip.gotoAndStop(3);
				}
				
				if(_jumpForce < 0)
					_jumpForce++;
			}
		}
		
		protected override function checkForCollision():void {
			super.checkForCollision();
			
			var levelMc:MovieClip = Level.getLevel();
			
			var left:int	= _movieClip.x - (_movieClip.width / 2);
			var right:int	= _movieClip.x + (_movieClip.width / 2);
			var top:int 	= _movieClip.y - (_movieClip.height / 2);
			var bottom:int	= _movieClip.y + (_movieClip.height / 2);
			
			var hitLeft:Boolean		= levelMc.hitTestPoint(left, _movieClip.y, true);
			var hitRight:Boolean	= levelMc.hitTestPoint(right, _movieClip.y, true);
			var hitTop:Boolean		= levelMc.hitTestPoint(_movieClip.x, top, true);
			var hitBottom:Boolean	= levelMc.hitTestPoint(_movieClip.x, bottom, true);
			
			if(hitLeft && _velocity.x == -1)
				_canMoveLeft = false;
			
			if(hitRight && _velocity.x == 1)
				_canMoveRight = false;
			
			if(hitTop)
				_jumpForce = 0;
			
			if(hitBottom)
				_onGround = true;
		}
		
		private function onKeyDown(e:KeyboardEvent):void {
			switch(e.keyCode) {
			case Keyboard.W:
				_jumpForce = _onGround ? -JUMP_FORCE : _jumpForce;
				_movieClip.gotoAndStop(3);
				break;
			case Keyboard.A:
				_velocity.x = -1;
				_movieClip.gotoAndStop(2);
				_movieClip.scaleX = 1;
				break;
			case Keyboard.S:
				pullLever();
				break;
			case Keyboard.D:
				_velocity.x = 1;
				_movieClip.gotoAndStop(2);
				_movieClip.scaleX = -1;
				break;
			}
		}
		
		private function onKeyUp(e:KeyboardEvent):void {
			var keyA:Boolean = (_velocity.x < 0 && e.keyCode == Keyboard.A);
			var keyD:Boolean = (_velocity.x > 0 && e.keyCode == Keyboard.D);
			
			if(keyA || keyD) {
				_velocity.x = 0;
				_movieClip.gotoAndStop(1);
			}
		}
	}
}