package gamejam.object.platform {
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Kevin Krol
	 */
	public class Platform extends MovieClip
	{
		private var _platform:MovieClip;
		public function Platform() 
		{
			_platform = new platform;
			addChild(_platform);
		}
		
	}

}