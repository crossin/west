package {
	import org.flixel.*;

	public class PlayStateHYD extends PlayState {
		[Embed(source="res/back.png")]
		private var ImgBack:Class;
		
		public function PlayStateHYD():void {
			super();
			back.loadGraphic(ImgBack);
		}
		
		override public function update():void {
			super.update();
		}
		
		override protected function addEnemy():void {
			if (timer % 4 < timerLast % 4){
				enemies.add(new EnemyXY());
			}
		}
	}
}