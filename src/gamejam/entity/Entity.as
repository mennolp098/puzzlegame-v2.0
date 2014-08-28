package gamejam.entity {
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	public class Entity extends MovieClip {
		protected var _movieClip:MovieClip;
		
		protected var _degreeCounter:int;
		
		protected var _hasToRotate:Boolean;
		
		public function Entity(movieClip:MovieClip, position:Point, rotation:Number) {
			_movieClip = movieClip;
			
			_movieClip.x = position.x;
			_movieClip.y = position.y;
			_movieClip.rotation = rotation;
			
			_degreeCounter = 0;
			_hasToRotate = false;
		}
		
		public function update():void {
			
		}
	}
}