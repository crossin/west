package {

	/**
	 * ...
	 * @author Crossin
	 */
	public class BulletPlayerSS extends BulletPlayer {
		[Embed(source="res/bullet_ss.png")]
		private var ImgBullet:Class;

		public static var bulletIndex:uint;

		public function BulletPlayerSS(){
			super(ImgBullet, 10);
			maxVelocity.x = 800;
		}

		override public function update():void {
			acceleration.x = 4 * velocity.x;
			velocity.y = (velocity.x == maxVelocity.x) ? 0 : velocity.y;
			super.update();
		}
	}
}