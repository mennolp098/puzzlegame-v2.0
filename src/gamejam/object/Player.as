package gamejam.object {
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.ui.Keyboard;
	import gamejam.object.GameObject;
	import gamejam.world.Level;
	import flash.display.MovieClip;
	import gamejam.RotationManager;
	
	public class Player extends GameObject {
		public static const PULLLEVER:String = "pullLever";
		
		private static const DEFAULT_SPEED:int = 7;
		private static const JUMP_FORCE:int = 32;
		
		private var _velocityX:Number;
		
		private var _speed:int;
		private var _jumpForce:int;
		
		public var _onGround:Boolean;
		
		private var _canMoveLeft:Boolean;
		private var _canMoveRight:Boolean;
		
		public function Player(position:Point) {
			super(new mannetje(), position);
			
			_speed = DEFAULT_SPEED;
			_velocityX = 0;
			
			_onGround = false;
			_canMoveLeft = false;
			_canMoveRight = false;
			
			_movieClip.scaleX = 0.5;
			_movieClip.scaleY = 0.5;
			_movieClip.gotoAndStop(1);
			
			Main.instance.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);			
			Main.instance.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		public override function update():void {
			_canMoveLeft = true;
			_canMoveRight = true;
			
			super.update();
			
			if(!isRotating()) {
				if(!(_velocityX == -1 && !_canMoveLeft) || !(_velocityX == 1 && !_canMoveRight))
					_movieClip.x += (_speed * _velocityX);
		
				_movieClip.y += _jumpForce + Level.GRAVITY;
				
				if(_onGround && _velocityX == 0) {
					_movieClip.gotoAndStop(1);
				} else if(!_onGround) {
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
			
			var hitSpike:Boolean	= _movieClip.hitTestObject(Level.getSpikes());
			
			if(hitLeft && _velocityX == -1)
				_canMoveLeft = false;
			
			if(hitRight && _velocityX == 1)
				_canMoveRight = false;
			
			if(hitTop)
				_jumpForce = 0;
			
			if (hitSpike){
				//TO DO: Death();
			}
				
			if(hitBottom) {
				_onGround = true;
				_movieClip.y -= Level.GRAVITY;
			} else {
				_onGround = false;
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void {
			switch(e.keyCode) {
			case Keyboard.W:
				jump();
				break;
			case Keyboard.A:
				move(-1);
				break;
			case Keyboard.S:
				pullLever();
				break;
			case Keyboard.D:
				move(1);
				break;
			default:
				RotationManager.handleKeyPress(e);
				break;
			}
		}
		
		private function onKeyUp(e:KeyboardEvent):void {
			var keyA:Boolean = (_velocityX < 0 && e.keyCode == Keyboard.A);
			var keyD:Boolean = (_velocityX > 0 && e.keyCode == Keyboard.D);
			
			if(keyA || keyD) {
				_velocityX = 0;
				_movieClip.gotoAndStop(1);
			}
		}
		
		private function move(direction:int):void {
			_velocityX = direction;
			
			_movieClip.scaleX = -direction / 2;
			_movieClip.gotoAndStop(2);
		}
		
		private function jump():void {
			if(_onGround) {
				_jumpForce = _onGround ? -JUMP_FORCE : _jumpForce;
				_movieClip.gotoAndStop(3);
			}
		}
		
		private function pullLever():void {
			if(RotationManager.complete()) {
				GameObject.rotate(RotationManager.getRotationDirection());
				RotationManager.generate();
			}
		}
	}
}