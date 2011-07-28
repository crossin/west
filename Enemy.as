package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Enemy extends FlxSprite {
		protected var score:int;
		protected var gibs:FlxEmitter 

		public function Enemy(img:Class, scr:int){
			super(0, 0, img);
			gibs = PlayState.gibsEnemy;
			score = scr;
		}

			


		override public function update():void {
			super.update();
			
			if (!onScreen()) {
				super.kill();
				trace("over!");
			}
		}
		
		override public function kill():void {
			super.kill();
			gibs.at(this);
			gibs.start(true, 0.5, 20);
			FlxG.score += score;
		}
	}
}