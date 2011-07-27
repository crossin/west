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
			x = 400;
			y = 300;
		}
	}
}