package {
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BackGround extends FlxSprite {

		public function BackGround(cls:Class, isfar:Boolean = false){
			super(0, 20, cls);
			if (isfar){
				velocity.x = -20;
			} else {
				velocity.x = -50;
			}
			x = 800 * Math.random();
			y = 400 - height + 40 * Math.random();
		}

		override public function update():void {
			if (x < -width){
				x = 640 + 800 * Math.random();
				y = 400 - height + 40 * Math.random();
			}
			super.update();
		}
	}

}