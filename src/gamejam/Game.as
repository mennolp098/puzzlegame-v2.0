package gamejam {
	import flash.events.Event;
	import flash.geom.Point;
	import gamejam.object.Player;
	import gamejam.world.Background;
	import gamejam.world.Level;
	
	public class Game {
		private var _player:Player;
		
		private var _background:Background;
		private var _lever:enemy;
		
		public function Game() {
			_player = new Player(new Point(300, 200));
			_background = new Background();
			
			Level.create(1);
			
			Main.instance.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(evt:Event):void {
			_player.update();
		}
	}
}