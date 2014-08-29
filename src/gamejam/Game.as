package gamejam {
	import flash.events.Event;
	import flash.geom.Point;
	import gamejam.object.Door;
	import gamejam.object.Lever;
	import gamejam.object.Player;
	import gamejam.world.Background;
	import gamejam.world.Level;
	import gamejam.object.Spike;
	
	public class Game {				
		private var _background:Background;
		private var _popupMenu:PopupMenu;
		
		public function Game() {
			_background = new Background();
			
			Level.create(1);
			RotationManager.generate();
			
			_popupMenu = new PopupMenu();
			
			_popupMenu.x = 400;
			_popupMenu.y = 400;
			_popupMenu.visible = false;
			
			Main.instance.addEventListener(Event.ENTER_FRAME, update);
			
			_popupMenu.addEventListener(PopupMenu.RESTARTLEVEL, resetLevel);
			_popupMenu.addEventListener(PopupMenu.NEXTLEVEL, nextLevel);
			Main.instance.addEventListener(Player.DEATH, death);
			
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
		
		private function nextLevel():void {
			// TODO: next level
		}
	}
}