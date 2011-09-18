package {
	/**
	 * ...
	 * @author Crossin
	 */
	public class BulletEnemy1 extends BulletEnemy {
		[Embed(source="res/bullet1.gif")]
		private var ImgBullet:Class;
		
		public static var bulletIndex:uint;
		
		public function BulletEnemy1(){
			super(ImgBullet, 5);
		}
	}
}