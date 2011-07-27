package {
	import org.flixel.*;

	public class PlayStateHYD extends PlayState {
		
		public function PlayStateHYD():void {
			super();
			enemies.add(new EnemyXY());
		}
		
		override public function update():void {

			super.update();
		}
	}
}