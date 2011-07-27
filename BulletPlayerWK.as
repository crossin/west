package {
	/**
	 * ...
	 * @author Crossin
	 */
	public class BulletPlayerWK extends BulletPlayer {
		[Embed(source="res/bullet_wk.png")]
		private var ImgBullet:Class;
		
		public static var bulletIndex:uint;
		
		public function BulletPlayerWK(){
			super(ImgBullet, 10);
		}
	}
}