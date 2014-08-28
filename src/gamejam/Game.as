package gamejam {
	import flash.events.Event;
	import flash.geom.Point;
	import gamejam.object.entity.Entity;
	import gamejam.object.entity.EntityPlayer;
	import gamejam.object.Level;
	import gamejam.world.Background;
	
	public class Game {
		private var _entities:Vector.<Entity>;
		private var _level:Level;
		
		private var _background:Background;
		private var _lever:enemy;
		
		public function Game() {
			_entities = new Vector.<Entity>();
			
			_background = new Background();
			_level = new Level(1);
			_lever = new enemy();
			
			_entities.push(new EntityPlayer(new Point(100, 0)));
			
			Main.instance.addChild(_lever);
			
			Main.instance.addEventListener(Event.ENTER_FRAME, update);
		}
		private function collisionChecker():void 
		{
			if (_platform.hitTestPoint(_player._movieClip.x, _player._movieClip.y - _player._movieClip.height/2)) 
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
		
		private function update(evt:Event):void {
			for each(var e:Entity in _entities)
				e.update();
			_level.update();
		}
	}
}