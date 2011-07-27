package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class PlayerSZ extends Player {
		[Embed(source="res/player_sz.png")]
		protected var ImgPlayer:Class;
		
		public function PlayerSZ() {
			super();
			loadGraphic(ImgPlayer);
			index = 0;
			bullets = PlayState.bulletsPlayerSZ.members;
			shootInterval = 0.15;
			x = 100;
			y = 200;
		}
		
		override protected function shoot1():void {
			var b:BulletPlayerSZ = bullets[BulletPlayerSZ.bulletIndex];
			b.reset(x + width, y + (height - b.height) / 2);
			b.velocity.x = 400;
			BulletPlayerSZ.bulletIndex ++ ;
			if (BulletPlayerSZ.bulletIndex >= bullets.length)
				BulletPlayerSZ.bulletIndex = 0;
		}
	}
}