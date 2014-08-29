package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import gamejam.Game;
	import gamejam.Menus.GameMenu;
	
	public class Main extends Sprite {
		public static var stageCenter:Point;
		
		public static var instance:Main;
		
		public var _gameMenu:GameMenu;
		
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
			
			_gameMenu = new GameMenu();
			addChild(_gameMenu);
			
			addEventListener(GameMenu.STARTGAME, startGame);
		}	
		private function startGame(e:Event):void {
			trace("dero2");
			new Game();
		}
	}
}