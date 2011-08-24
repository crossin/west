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
			super(ImgPlayer);
			index = 0;
			bullets = PlayState.bulletsPlayerSZ.members;
			shootInterval = 0.5;
			healthMax = 100;
			x = 100;
			y = 200;
		}
		
		override protected function shoot1():void {
			var b:BulletPlayerSZ = bullets[BulletPlayerSZ.bulletIndex];
			b.reset(x + width / 2, y + (height - b.height) / 2);
			b.velocity.x = b.unitVelocity;
			b.velocity.y = 0;
			b.angleNow = 0;
			b.target = (FlxG.state as PlayState).enemies.getFirstAlive() as Enemy;
			BulletPlayerSZ.bulletIndex ++ ;
			if (BulletPlayerSZ.bulletIndex >= bullets.length)
				BulletPlayerSZ.bulletIndex = 0;
		}
	}
}