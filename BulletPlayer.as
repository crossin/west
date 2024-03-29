package {
	import org.flixel.FlxEmitter;
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BulletPlayer extends FlxSprite {
		public var damage:int;
		
		public function BulletPlayer(img:Class, dmg:int){
			super(0, 0, img);
			exists = false;
			damage = dmg;
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