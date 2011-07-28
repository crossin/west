package {
	import org.flixel.*;

	public class PlayStateHYD extends PlayState {
		
		public function PlayStateHYD():void {
			super();
			
		}
		
		override public function update():void {
			super.update();
		}
		
		override protected function addEnemy():void {
			if (timer % 2 < timerLast % 2){
				enemies.add(new EnemyXY());
			}
		}
	}
}