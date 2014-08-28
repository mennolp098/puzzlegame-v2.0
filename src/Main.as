package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import gamejam.Game;
	
	public class Main extends Sprite {
		public static var stageCenter:Point;
		
		public static var instance:Main;
		
		public function Main():void {
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
			
			new Game();
		}	
	}
}