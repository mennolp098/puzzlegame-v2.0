package  
{
	import flash.display.Sprite;
	import org.flashdevelop.utils.TraceLevel;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Game extends Sprite
	{
		//game setup
		private var _player:Player;
		private var _background:Background;
		private var _level:Level;
		
		//vars for rotation
		private var _radians:Number = 0;
		private	var _degrees:Number = 0;
		private	var _pos_x:Number = 400; // random primary x position
		private	var _pos_y:Number = 400; // random primary y position
		private	var _radius:Number = 100;
		private var _myIndetifier:Timer;
		private var _degreesCounter:Number = 0;
		private var _firstTime:Boolean;
		
		public function Game() 
		{
			_player = new Player();
			_background = new Background();
			_level = new Level();
			
			addChild(_player);
			addChild(_background);
			addChild(_level);
			
		}
		
	}

}