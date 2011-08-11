package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class PlayerSS extends Player {
		[Embed(source="res/player_ss.png")]
		protected var ImgPlayer:Class;
		
		public function PlayerSS() {
			super(ImgPlayer);
			index = 3;
			bullets = PlayState.bulletsPlayerSS.members;
			shootInterval = 1.5;
			x = 100;
			y = 400;
		}
		
		override protected function shoot1():void {
			var b:BulletPlayerSS = bullets[BulletPlayerSS.bulletIndex];
			b.reset(x + width / 2, y + (height - b.height) / 2);
			b.velocity.x = 50;
			b.velocity.y = 80;
			BulletPlayerSS.bulletIndex ++ ;
			if (BulletPlayerSS.bulletIndex >= bullets.length)
				BulletPlayerSS.bulletIndex = 0;
		}
	}
}