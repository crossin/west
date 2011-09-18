package {
	/**
	 * ...
	 * @author Crossin
	 */
	public class BulletPlayerBJ extends BulletPlayer {
		[Embed(source="res/bullet_bj.png")]
		private var ImgBullet:Class;
		
		public static var bulletIndex:uint;
		
		public function BulletPlayerBJ(){
			super(ImgBullet, 5);
		}
	}
}