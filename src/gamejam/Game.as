package gamejam {
	import flash.events.Event;
	import flash.geom.Point;

	import gamejam.object.Player;
	import gamejam.world.Background;
	import gamejam.world.Level;
	
	public class Game {
		private var _player:Player;
		private var _level:Level;
		private var _spikes:Spikes;
		
		private var _background:Background;
		private var _door:Door;
		private var _popupMenu:PopupMenu;
		
		public function Game() {
			_player = new Player(new Point(300, 200));
			_background = new Background();
			
			Level.create(1);
			
			_spikes = new Spikes();
			_door = new Door();
			_popupMenu = new PopupMenu();
			
			_entities.push(new EntityPlayer(new Point(200, 100)));
			
			Main.instance.addChild(_popupMenu);
			
			_popupMenu.x = 400;
			_popupMenu.y = 400;
			_popupMenu.visible = false;
			_level._movieClip.x = 400;
			_level._movieClip.y = 400;
			Main.instance.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function popupMenu(won:Boolean):void {
			_popupMenu.visible = true;
			_popupMenu.popupState(won);
		}
		
		private function update(evt:Event):void {
			_player.update();
		}
	}
}