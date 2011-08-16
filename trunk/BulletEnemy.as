package {
	import org.flixel.FlxSprite;
	import org.flixel.FlxEmitter;
	
	/**
	 * ...
	 * @author Crossin
	 */
	public class BulletEnemy extends FlxSprite {
		[Embed(source="res/bullet.png")]
		private var ImgBullet:Class;
		
		public static var bulletIndex:uint;
		
		public var damage:int;
		
		public function BulletEnemy(){
			super(0, 0, ImgBullet);
			exists = false;
			damage = 10;
		}
		
		override public function update():void {
			super.update();
			if (!onScreen()) {
				super.kill();
			}
		}
		
		override public function kill():void {
			super.kill();
			var gibs:FlxEmitter = PlayState.gibsBullet;
			gibs.at(this);
			gibs.start(true, 0.5, 1);
		}
	
	}
}