package gamejam {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import gamejam.object.Door;
	import gamejam.object.entity.Entity;
	import gamejam.object.entity.EntityPlayer;
	import gamejam.object.Level;
	import gamejam.object.Spikes;
	import gamejam.world.Background;
	
	public class Game {
		private var _entities:Vector.<Entity>;
		private var _level:Level;
		private var _spikes:Spikes;
		
		private var _background:Background;
		private var _lever:enemy;
		private var _door:Door;
		private var _popupMenu:PopupMenu;
		
		public function Game() {
			_entities = new Vector.<Entity>();
			
			_background = new Background();
			_level = new Level(1);
			_lever = new enemy();
			_spikes = new Spikes();
			_door = new Door();
			_popupMenu = new PopupMenu();
			
			_entities.push(new EntityPlayer(new Point(200, 100)));
			
			Main.instance.addChild(_lever);
			Main.instance.addChild(_popupMenu);
			
			_popupMenu.x = 400;
			_popupMenu.y = 400;
			_popupMenu.visible = false;
			_level._movieClip.x = 400;
			_level._movieClip.y = 400;
			Main.instance.addEventListener(Event.ENTER_FRAME, update);
			_popupMenu.addEventListener(PopupMenu.RESETLEVEL, resetLevel);
			_popupMenu.addEventListener(PopupMenu.NEXTLEVEL, nextLevel);
		}
		
		private function collisionChecker():void {
			var player:EntityPlayer = _entities[0] as EntityPlayer;
			
			var playerMc:MovieClip = player._movieClip;
			var levelMc:MovieClip = _level._movieClip;
			var spikesMc:MovieClip = _spikes._movieClip;
			var doorMc:MovieClip = _door._movieClip;
			
			if(levelMc.hitTestObject(playerMc)) {
				//trace("Hit test object");
				var playerCenterX:Number = (playerMc.x + (playerMc.width / 2));
			
				var checkTop:Boolean = levelMc.hitTestPoint(playerCenterX, (playerMc.y - playerMc.height), true);
				var checkBottom:Boolean = levelMc.hitTestPoint(playerCenterX, playerMc.y, true);
				var checkSpikes:Boolean = spikesMc.hitTestObject(playerMc);
				var checkDoor:Boolean = doorMc.hitTestObject(playerMc);
				
				if(checkBottom) {
					playerMc.y -= 2;
					player._onGround = true;
				} else if(checkTop) {
					_entities[0].jumpForce = 0;
				} else if (checkSpikes) {
					popupMenu(false)
				} else if (checkDoor) {
					popupMenu(true);
				}
			} else {
				player._onGround = false;
			}
		}
		private function popupMenu(won:Boolean):void {
			_popupMenu.visible = true;
			_popupMenu.popupState(won);
		}
		private function update(evt:Event):void {
			for each(var e:Entity in _entities)
				e.update();
				
			_level.update();
			
			collisionChecker()
		}
		private function resetLevel() {
			// TO DO: reset level
		}
		private function nextLevel() {
			// TO DO: next level
		}
	}
}