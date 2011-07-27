package {
	/**
	 * ...
	 * @author Crossin
	 */
	public class BulletPlayerSZ extends BulletPlayer {
		[Embed(source="res/bullet_sz.png")]
		private var ImgBullet:Class;
		
		public static var bulletIndex:uint;
		
		public function BulletPlayerSZ(){
			super(ImgBullet, 10);
		}
	}
}