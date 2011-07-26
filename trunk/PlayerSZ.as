package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class PlayerSZ extends Player {
		[Embed(source="res/sanzang.png")]
		protected var ImgPlayer:Class;
		
		public function PlayerSZ() {
			super();
			loadGraphic(ImgPlayer);
			index = 0;
			x = 100;
			y = 200;
		}
	}
}