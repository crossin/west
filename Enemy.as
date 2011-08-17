package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Enemy extends FlxSprite {
		protected var score:int;
		protected var gibs:FlxEmitter;
		protected var bullets:Array;
		protected var alive:Boolean;
		protected var timer:Number;
		protected var timerLast:Number;

		public function Enemy(img:Class, scr:int){
			super(0, 0, img);
			gibs = PlayState.gibsEnemy;
			score = scr;
			alive = false;
			timer = 0;
			timerLast = 0;
		}

			


		override public function update():void {
			super.update();
			timerLast = timer;
			timer += FlxG.elapsed;
			if (onScreen()) {
				alive = true;
			} else if (alive) {
				super.kill();
			}
		}
		
		override public function kill():void {
			super.kill();
			gibs.at(this);
			gibs.start(true, 0.5, 20);
			FlxG.score += score;
		}
		
		protected function shoot():void {
			// to be overridden
		}
	}
}