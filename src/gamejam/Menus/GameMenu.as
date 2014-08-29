package gamejam.Menus
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import gamejam.Game;
	
	/**
	 * ...
	 * @author Bart van der Geest
	 */
	public class GameMenu extends Sprite
	{
		private var _startButton:StartButton;
		public static var STARTGAME:String = "YOLOSWAG";
		//private var _muteButton:MuteButton;
		
		
		public function GameMenu() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init (e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_startButton = new StartButton;
			_startButton.x = 200;
			_startButton.y = 200;
			addChild(_startButton);
			
			/*_muteButton = new MuteButton;
			_muteButton.x = 200;
			_muteButton.y = 150;
			addChild(_muteButton);
			*/
			var buttonsHolder:MovieClip = new MovieClip;
			addChild(buttonsHolder);
			buttonsHolder.addChild(_startButton);
			buttonsHolder.addEventListener(MouseEvent.CLICK, mouseClick);
			
		}
		public function mouseClick (e:MouseEvent):void
		{
			if (e.target == _startButton)
			Main.instance.dispatchEvent(new Event(STARTGAME));
		}
	}

}