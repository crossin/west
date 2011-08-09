package {
	import org.flixel.*;

	public class PlayStateHYD extends PlayState {
		[Embed(source="res/back_hyd_n.png")]
		private var ImgBackNear:Class;
		[Embed(source="res/back_hyd_f.png")]
		private var ImgBackFar:Class;
		
		public function PlayStateHYD():void {
			super();
			backNear.loadGraphic(ImgBackNear);
			backFar.loadGraphic(ImgBackFar);
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