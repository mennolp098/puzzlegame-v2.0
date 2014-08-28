package gamejam.world {
	import flash.display.MovieClip;
	
	public class Level extends MovieClip {
		private var _level:platform;
		
		public function Level() {
			_level = new platform();
			addChild(_level);
		}
	}
}