package {
	import org.flixel.FlxG;
	import org.flixel.FlxU;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BulletPlayerSZ extends BulletPlayer {
		[Embed(source="res/bullet_sz.png")]
		private var ImgBullet:Class;

		public var target:Enemy;
		public var angleNow:Number;
		public var angleDest:Number;
		public var unitVelocity:int;
		public var unitVelocityAngle:int;

		public static var bulletIndex:uint;

		public function BulletPlayerSZ(){
			super(ImgBullet, 3);
			unitVelocity = 300;
			unitVelocityAngle = 8;
		}

		override public function update():void {
			if (target){
				angleDest = FlxU.getAngle(target.x - x, target.y - y);
				if (FlxU.abs(angleNow - angleDest) > 1 && FlxU.abs(angleNow - angleDest) < 359){
					if (angleDest < 0){
						if (angleNow > angleDest && angleNow - angleDest < 180){
							angleNow -= unitVelocityAngle;
						} else {
							angleNow += unitVelocityAngle;
						}
					} else {
						if (angleDest > angleNow && angleDest - angleNow < 180){
							angleNow += unitVelocityAngle;
						} else {
							angleNow -= unitVelocityAngle;
						}
					}
				}
				velocity = FlxU.rotatePoint(unitVelocity, 0, 0, 0, angleNow);
			}
			if (!target || !target.exists){
				target = (FlxG.state as PlayState).enemies.getFirstAlive() as Enemy;
			}

			super.update();
		}
	}
}