package gamejam.object.entity {
	import flash.display.MovieClip;
	import flash.geom.Point;
	import gamejam.Game;
	import gamejam.object.GameObject;
	
	public class Entity extends GameObject {
		public function Entity(movieClip:MovieClip, position:Point, rotation:Number) {
			super(movieClip, position, rotation);
		}
		
		public override function update():void {
			
		}
	}
}