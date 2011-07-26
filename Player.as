package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Player extends FlxSprite {
		protected var speed:Number;
		
		public function Player() {
			super();
			maxVelocity.x = 170;
			maxVelocity.y = 170;
			drag.x = 500;
			drag.y = 500;
		}

		override public function update():void {
			acceleration.x = 0;
			acceleration.y = 0;

			if ((FlxG.state as PlayState).playerNow == this) {
				if (FlxG.keys.A){
					acceleration.x -= drag.x;
				}
				if (FlxG.keys.D){
					acceleration.x += drag.x;
				}
				if (FlxG.keys.W){
					acceleration.y -= drag.y;
				}
				if (FlxG.keys.S){
					acceleration.y += drag.y;
				}
			}

			speed = Math.sqrt(velocity.x * velocity.x + velocity.y * velocity.y)
			if (speed > maxVelocity.x){
				velocity.x *= (maxVelocity.x / speed);
				velocity.y *= (maxVelocity.y / speed);
			}
			super.update();
		}

	}
}