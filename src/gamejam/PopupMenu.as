package gamejam 
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class PopupMenu extends MovieClip
	{
		private var _button:MovieClip;
		
		public static const NEXTLEVEL		:	String	=	"nextlevel";
		public static const RESTARTLEVEL    :   String  =   "restartlevel";
		
		public function create(won:Boolean):void {
			if(_button != null)
				Main.instance.removeChild(_button);
			
			switch(won) {
			case true:
				_button = new nextlevelbutton();
				break;
			case false:
				_button = new tryagainbutton();
				break;
			default:
				trace("button " + won + " is null");
				return;
			}
			Main.instance.addChild(_button);
			
			var buttonsHolder:MovieClip = new MovieClip();
			addChild(buttonsHolder);
			buttonsHolder.addChild(_button);
			buttonsHolder.addEventListener(MouseEvent.CLICK, onClick);
			
			_button.y = 360;
			_button.x = 360;
		}
		private function onClick(e:MouseEvent):void 
		{
			if (e.target == _button && _button is nextlevelbutton) 
			{
				dispatchEvent(new Event(NEXTLEVEL));
			} else
			{
				dispatchEvent(new Event(RESTARTLEVEL));
			}
		}
		public function popupState(won:Boolean):void {
			if (won) {
				_button = new nextlevelbutton();
			}else {
				_button = new tryagainbutton();
			}
		}
	}

}