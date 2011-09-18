package {
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Tag extends FlxGroup {
		public var back:FlxSprite;
		public var fore:FlxSprite;

		public function Tag(){
			back = new FlxSprite();
			back.createGraphic(42, 3, 0xff000000);
			add(back);
			fore = new FlxSprite(1, 1);
			fore.createGraphic(40, 1, 0xffff7777);
			fore.origin.x = 0;
			add(fore);
		}

		public function change(ix:int, iy:int, ratio:Number):void {
			back.x = ix;
			back.y = iy;
			fore.x = ix+1;
			fore.y = iy + 1;
			fore.scale.x = ratio;
		}
	}

}