package gamejam.object {
	import flash.display.MovieClip;
	import flash.geom.Point;
	import gamejam.object.GameObject;
	
	public class Level extends GameObject {
		public function Level(levelId:int) {
			var mc:MovieClip = null;
			
			switch(levelId) {
			case 1:
				mc = new platform();
				break;
			default:
				trace("Level " + levelId + " doesn't exist");
				break;
			}
			
			super(mc, new Point(0, 0), 0);
		}
	}
}