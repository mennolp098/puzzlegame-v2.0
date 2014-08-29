package {
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import gamejam.Game;
	import gamejam.Menus.GameMenu;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Main extends Sprite 
	{
		public static var instance:Main;
		private var _menu:GameMenu;
		private var _game:Game;
		
		public function Main():void {
			if(stage) {
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			instance = this;
			
			_menu = new GameMenu();
			addChild(_menu);
			_menu.addEventListener(GameMenu.STARTGAME, startGame);
		}	
		private function startGame ():void
		{
			_game = new Game();
		}
	}
}