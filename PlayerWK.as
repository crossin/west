package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class PlayerWK extends Player {
		[Embed(source="res/player_wk.png")]
		protected var ImgPlayer:Class;

		public function PlayerWK(){
			super(ImgPlayer);
			index = 1;
			bullets = PlayState.bulletsPlayerWK.members;
			shootInterval = 0.15;
			healthMax = 100;
			x = 100;
			y = 100;
		}

		override protected function shoot1():void {
			var b:BulletPlayerWK = bullets[BulletPlayerWK.bulletIndex];
			b.reset(x + width / 2, y + (height - b.height) / 2);
			b.velocity.x = 500;
			BulletPlayerWK.bulletIndex++;
			if (BulletPlayerWK.bulletIndex >= bullets.length)
				BulletPlayerWK.bulletIndex = 0;
		}
	}
}