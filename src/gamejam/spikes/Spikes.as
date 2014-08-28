package gamejam.spikes
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Spikes extends MovieClip
	{
		private var _spikes:MovieClip;
		public function Spikes() 
		{
			_spikes = new MovieClip;
			addChild(_spikes);
		}
		
	}

}