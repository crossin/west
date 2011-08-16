package {
	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyXY extends Enemy {
		[Embed(source="res/enemy_xy.png")]
		private var ImgEnemy:Class;

		public function EnemyXY(){
			super(ImgEnemy, 100);
			x = 800;
			y = 300;
			velocity.x = -100;
		}
		
		override public function update():void {
			super.update();
			// move
			if (x < 400) {
				velocity.x = 0;
			}
			if (timer >= 6) {
				velocity.x = 100;
			}
			// shoot
			if (timer >= 4 && timerLast < 4) {
				shoot();
			}
		}
		
		override protected function shoot():void {
			var b:BulletEnemy = bullets[BulletEnemy.bulletIndex];
			b.reset(x + width / 2, y + (height - b.height) / 2);
			b.velocity.x = -100;
			BulletEnemy.bulletIndex++;
			if (BulletEnemy.bulletIndex >= bullets.length)
				BulletEnemy.bulletIndex = 0;		}
	}
}