package gamejam.Menu {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import gamejam.Game;
	
	public class Menu extends Sprite {
		public static const START_GAME:String = "startGame";
		
		private var _startButton:StartButton;
		private var _backGround:MovieClip;
		
		public function Menu() {
			if(stage) {
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event = null):void {	
			_backGround = new menubackground();
			_backGround.x = 360;
			_backGround.y = 360;
			addChild(_backGround);
			
			_startButton = new StartButton();
			_startButton.x = 360;
			_startButton.y = 160;
			addChild(_startButton);
			
			var buttonsHolder:MovieClip = new MovieClip();
			addChild(buttonsHolder);
			buttonsHolder.addChild(_startButton);
			buttonsHolder.addEventListener(MouseEvent.CLICK, mouseClick);
		}
		
		private function mouseClick(e:MouseEvent):void {
			if(e.target == _startButton)
				Main.instance.dispatchEvent(new Event(START_GAME));
		}
	}

}