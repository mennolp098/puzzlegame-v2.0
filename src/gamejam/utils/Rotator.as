package gamejam.utils {
	import flash.geom.Point;
	import flash.utils.Timer;
	
	public class Rotator {
		private var timer:Timer;
		
		private var radians:Number;
		private var degrees:Number;
		private var radius:Number;
		
		private var newRotation:Number;
		
		public function Rotator(position:Point) {
			
		}
		
		public function stop():void {
			timer.stop();
		}
		
		public function getNewRotation():Number {
			return newRotation;
		}
	}
}