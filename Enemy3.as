package {

	/**
	 * ...
	 * @author Crossin
	 */
	public class Enemy3 extends Enemy {
		[Embed(source="res/enemy_3.gif")]
		private var ImgEnemy:Class;

		public function Enemy3(ix:int, iy:int){
			super(ImgEnemy, 100);
			bullets = PlayState.bulletsEnemy1.members;
			x = ix;
			y = iy;
			velocity.x = -150;
			health = 50;
		}

		override public function update():void {
			super.update();
			// move
			if (timer >= 2 && timerLast < 2){
				velocity.x = 0;
			}
			if (timer >= 3 && timerLast < 3){
				velocity.x = 150;
			}
			// shoot
			if (timer >= 2 && timerLast < 2){
				shoot();
			}
		}

		override protected function shoot():void {
			var b:BulletEnemy1 = bullets[BulletEnemy1.bulletIndex];
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			b.velocity.x = -100;
			BulletEnemy1.bulletIndex++;
			if (BulletEnemy1.bulletIndex >= bullets.length)
				BulletEnemy1.bulletIndex = 0;
		}
	}
}