package gamejam 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class PopupMenu extends MovieClip
	{
		private var _nextLevelButton:StartButton;
		private var _restartLevelButton:StartButton;
		private var _background:MenuBackground;
		
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