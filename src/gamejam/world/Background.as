package gamejam.world {
	import flash.display.MovieClip;
	
	public class Background {
		private var _backGround:MovieClip;
		
		public function Background() {
			_backGround = new back1();
			
			Main.instance.addChild(_backGround);
		}
	}
}