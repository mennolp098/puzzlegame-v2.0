package gamejam.object.entity {
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.ui.Keyboard;
	import gamejam.world.World;
	import flash.events.Event;
	
	public class EntityPlayer extends Entity {
		public static const PULLLEVER:String = "pulllever";
		
		private static const DEFAULT_SPEED:int = 3;
		private static const DEFAULT_JUMP_FORCE:int = 15;
		private static const HIGH_JUMP_FORCE:int = 20;
		
		private var _velocity:Vector3D;
		
		private var _speed:int;
		private var _gravityMultiplier:int;
		
		public var _jumpForce:int;
		public var _onGround:Boolean;
		private var _highJump:Boolean;
		
		public function EntityPlayer(position:Point) {
			super(new mannetje(), position, 0);
			
			_velocity = new Vector3D();
			
			_speed = DEFAULT_SPEED;
			_gravityMultiplier = 1;
			
			_onGround = false;
			_highJump = false;
			
			_movieClip.gotoAndStop(1);
			
			Main.instance.stage.addEventListener(KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent):void {
				switch(e.keyCode) {
				case Keyboard.W:
					jump();
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
			});
			
			Main.instance.stage.addEventListener(KeyboardEvent.KEY_UP, function(e:KeyboardEvent):void {
				if((_velocity.x < 0 && e.keyCode == Keyboard.A) || (_velocity.x > 0 && e.keyCode == Keyboard.D)) {
					_velocity.x = 0;
					_movieClip.gotoAndStop(1);
				}
			});
		}
		
		private function pullLever():void {
			Main.instance.dispatchEvent(new Event(PULLLEVER));
		}
		
		public override function update():void {
			super.update();
			if (!_onGround) {
				_movieClip.gotoAndStop(3);
			}
			if(!isRotating()) {
				_movieClip.x += (_speed * _velocity.x);
				_movieClip.y += (_jumpForce + _velocity.y + (World.GRAVITY * _gravityMultiplier));
			}
		}
		
		private function jump():void {
			if(_onGround) {
				_movieClip.x += (_speed * _velocity.x);
				_movieClip.y += (_jumpForce + _velocity.y + (World.GRAVITY * _gravityMultiplier));
				
				trace((_jumpForce + _velocity.y + (World.GRAVITY * _gravityMultiplier)));
				
				if(_jumpForce > 0)
					_jumpForce--;
			}
		}
	}
}