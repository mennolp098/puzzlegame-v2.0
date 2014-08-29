package gamejam {
	import flash.events.Event;
	import flash.geom.Point;
	import gamejam.object.Door;
	import gamejam.object.Lever;
	import gamejam.object.Player;
	import gamejam.world.Level;
	import gamejam.object.Spike;
	
	public class Game {				
		private var _popupMenu:PopupMenu;
		
		public function Game() {
			
			Level.create(2);
			RotationManager.generate();
			
			_popupMenu = new PopupMenu();
			
			_popupMenu.x = 400;
			_popupMenu.y = 400;
			_popupMenu.visible = false;
			
			Main.instance.addEventListener(Event.ENTER_FRAME, update);
			Main.instance.addEventListener(Player.DEATH, death);
			Main.instance.addEventListener(Player.NEXT_LEVEL, nextLevel);
			
			_popupMenu.addEventListener(PopupMenu.RESTARTLEVEL, resetLevel);
			_popupMenu.addEventListener(PopupMenu.NEXTLEVEL, nextLevel);
			
			Main.instance.addChild(_popupMenu);
		}
		private function death(e:Event):void
		{
			_popupMenu.visible = true;
			_popupMenu.popupState(false);
		}
		private function won(e:Event):void {
			_popupMenu.visible = true;
			_popupMenu.popupState(true);
		}
		
		private function update(e:Event):void {
			Level.update();
		}
		
		private function resetLevel():void {
			// TODO: reset level
		}
		
		private function nextLevel(e:Event):void {
			Level.create(2);
		}
	}
}