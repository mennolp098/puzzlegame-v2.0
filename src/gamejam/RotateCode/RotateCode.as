package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class RotateCode extends MovieClip
	{
		private var _rotateCode:Array;
		private var _keyCodes:Array;
		public function RotateCode() 
		{
			_keyCodes = [];
			_rotateCode = [];
			_keyCodes[0] = 89;
			_keyCodes[1] = 85;
			_keyCodes[2] = 73;
			_keyCodes[3] = 79;
			_keyCodes[4] = 80;
			generateCode();
		}
		public function generateCode() 
		{
			for (var i:int = 0; i < 5; i++) 
			{
				r:int = Math.random() * 5;
				_rotateCode[i] = _keyCodes[r];
			}
		}
	}
}