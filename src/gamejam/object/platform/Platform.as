package gamejam.object.platform {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Kevin Krol
	 */
	public class Platform extends Sprite
	{
		private var _platform:MovieClip;
		public function Platform() 
		{
			_platform = new platform;
			addChild(_platform);
		}
		
	}

}