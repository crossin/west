package {

	/**
	 * ...
	 * @author Crossin
	 */
	public class Enemy2 extends Enemy {
		[Embed(source="res/enemy_2.gif")]
		private var ImgEnemy:Class;

		public function Enemy2(ix:int, iy:int){
			super(ImgEnemy, 100);
			bullets = PlayState.bulletsEnemy1.members;
			x = ix;
			y = iy;
			velocity.y = y < 0 ? 100 : -100;
			health = 50;
		}

		override public function update():void {
			super.update();
			// move
			if (timer >= 3 && timerLast < 3){
				acceleration.x = 150;
			}
			// shoot
			if (timer >= 3 && timerLast < 3){
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