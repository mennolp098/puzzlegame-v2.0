package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import gamejam.Game;
	import gamejam.Menu.Menu;
	
	public class Main extends Sprite {
		public static var stageCenter:Point;
		
		public static var instance:Main;
		
		private var _menu:Menu;
		private var _game:Game;
		
		public function Main() {
			if(stage) {
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stageCenter = new Point(stage.stageWidth / 2, stage.stageHeight / 2)
			instance = this;
			
			_menu = new Menu();
			addChild(_menu);
			
			addEventListener(Menu.START_GAME, startGame);
		}
		
		private function startGame(e:Event):void {
			removeChild(_menu);
			_game = new Game();
		}
	}
}