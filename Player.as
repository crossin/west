package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Player extends FlxSprite {
		protected var speed:Number;
		protected var index:int;
		protected var shoot:Function;
		protected var shootClock:Number;
		protected var shootInterval:Number;
		protected var bullets:Array;
		public var healthMax:Number;

		public function Player(img:Class){
			super();
			loadGraphic(img, true, false, 48, 64);
			addAnimation("play", [0, 1], 8);
			play("play");
			maxVelocity.x = 170;
			maxVelocity.y = 170;
			drag.x = 500;
			drag.y = 500;
			shoot = shoot1;
			shootInterval = 0.15;
			restartClock();
		}

		override public function update():void {
			shootClock -= FlxG.elapsed;
			acceleration.x = 0;
			acceleration.y = 0;

			if (PlayState.playerNow == index){
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

				PlayState.tag.change(x + 3, y, health/healthMax);
			}

			speed = Math.sqrt(velocity.x * velocity.x + velocity.y * velocity.y)
			if (speed > maxVelocity.x){
				velocity.x *= (maxVelocity.x / speed);
				velocity.y *= (maxVelocity.y / speed);
			}

			// shoot
			if (shootClock < 0){
				restartClock();
				shoot();
			}

			super.update();

			x = x < 0 ? 0 : x;
			x = x > 592 ? 592 : x;
			y = y < 20 ? 20 : y;
			y = y > 336 ? 336 : y;
		}

		protected function shoot1():void {
			// to be overridden
		}

		protected function restartClock():void {
			shootClock = shootInterval;
		}

		public function refresh():void {
			health = healthMax;
		}
	}
}