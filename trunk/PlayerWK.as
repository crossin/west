package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class PlayerWK extends Player {
		[Embed(source="res/wukong.png")]
		protected var ImgPlayer:Class;
		
		public function PlayerWK() {
			super();
			loadGraphic(ImgPlayer);
			x = 100;
			y = 100;
		}
	}
}