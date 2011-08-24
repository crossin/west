package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class PlayerBJ extends Player {
		[Embed(source="res/player_bj.png")]
		protected var ImgPlayer:Class;
		
		public function PlayerBJ() {
			super(ImgPlayer);
			index = 2;
			bullets = PlayState.bulletsPlayerBJ.members;
			shootInterval = 0.2;
			healthMax = 100;
			x = 100;
			y = 30;
		}
		
		override protected function shoot1():void {
			var b:BulletPlayerBJ = bullets[BulletPlayerBJ.bulletIndex];
			b.reset(x + width / 2, y + (height - b.height) / 2);
			b.velocity.x = 500;
			BulletPlayerBJ.bulletIndex ++ ;
			if (BulletPlayerBJ.bulletIndex >= bullets.length)
				BulletPlayerBJ.bulletIndex = 0;
		}
	}
}