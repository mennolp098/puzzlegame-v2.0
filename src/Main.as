package {
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import gamejam.Game;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Main extends Sprite 
	{
		public static var instance:Main;
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
			
			_game = new Game();
		}	
	}
}