package gamejam.object {
	import flash.geom.Point;
	
	public class Door extends GameObject {
		public function Door() {
			super(new spikes(), new Point(0, 0));
		}
	}
}