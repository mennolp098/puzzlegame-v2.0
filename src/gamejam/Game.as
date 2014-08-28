package gamejam {
	import flash.events.Event;
	import flash.geom.Point;
	import gamejam.object.entity.Entity;
	import gamejam.object.entity.EntityPlayer;
	import gamejam.object.Level;
	import gamejam.world.Background;
	
	public class Game {
		private var _entities:Vector.<Entity>;
		private var _level:Level;
		
		private var _background:Background;
		private var _lever:enemy;
		
		public function Game() {
			_entities = new Vector.<Entity>();
			
			_background = new Background();
			_level = new Level(1);
			_lever = new enemy();
			
			_entities.push(new EntityPlayer(new Point(100, 0)));
			
			Main.instance.addChild(_lever);
			
			Main.instance.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(evt:Event):void {
			for each(var e:Entity in _entities)
				e.update();
			
			_level.update();
		}
	}
}