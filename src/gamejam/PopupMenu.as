package gamejam 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class PopupMenu extends MovieClip
	{
		private var _nextLevelButton:StartButton;
		private var _restartLevelButton:StartButton;
		private var _background:MenuBackground;
		
		public static const NEXTLEVEL		:	String	=	"nextlevel";
		public static const RESTARTLEVEL    :   String  =   "restartlevel"
		
		public function PopupMenu() 
		{
			_nextLevelButton = new StartButton();
			_restartLevelButton = new StartButton();
			_background = new MenuBackground();
			
			addChild(_nextLevelButton);
			addChild(_background);
			addChild(_restartLevelButton);
			
			_nextLevelButton.y = 40;
			_nextLevelButton.x = 40;
			_restartLevelButton.y = _nextLevelButton.y;
			_restartLevelButton.x = _nextLevelButton.x;
			
			var buttonsHolder:MovieClip = new MovieClip();
			addChild(buttonsHolder);
			buttonsHolder.addChild(_nextLevelButton);
			buttonsHolder.addChild(_restartLevelButton);
			buttonsHolder.addEventListener(MouseEvent.CLICK, onClick);
		}
		private function onClick(e:MouseEvent):void 
		{
			if (e.target == _nextLevelButton) 
			{
				dispatchEvent(new Event(NEXTLEVEL));
			} else if (e.target == _restartLevelButton) 
			{
				dispatchEvent(new Event(RESTARTLEVEL));
			}
			//TO DO: Mute button en exit
		}
		public function popupState(won:Boolean):void {
			if (won) {
				_nextLevelButton.visible = true;
			}else {
				_restartLevelButton.visible = true;
			}
		}
	}

}