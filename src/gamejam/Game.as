package gamejam {
	import flash.display.MovieClip;
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
		
		private function collisionChecker():void {
			var player:EntityPlayer = _entities[0] as EntityPlayer;
			
			var playerMc:MovieClip = player._movieClip;
			var levelMc:MovieClip = _level._movieClip;
			
			if(levelMc.hitTestObject(playerMc)) {
				//trace("Hit test object");
				var playerCenterX:Number = (playerMc.x + (playerMc.width / 2));
			
				var checkTop:Boolean = levelMc.hitTestPoint(playerCenterX, (playerMc.y - playerMc.height), true);
				var checkBottom:Boolean = levelMc.hitTestPoint(playerCenterX, playerMc.y, true);
				
				trace(checkBottom, checkTop);
				if(checkBottom) {
					playerMc.y -= 2;
					player._onGround = true;
				} else if(checkTop) {
					// TODO: Jumpforce = 0;
				}
			} else {
				player._onGround = false;
			}
		}
		
		private function update(evt:Event):void {
			for each(var e:Entity in _entities)
				e.update();
				
			_level.update();
			
			collisionChecker()
		}
	}
}