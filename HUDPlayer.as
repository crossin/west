package {
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author crossin
	 */
	public class HUDPlayer extends FlxGroup {
		[Embed(source="res/hud_back.png")]
		private var ImgBack:Class;
		[Embed(source="res/hud_head_sz.png")]
		private var ImgHeadSZ:Class;
		[Embed(source="res/hud_head_wk.png")]
		private var ImgHeadWK:Class;
		[Embed(source="res/hud_head_bj.png")]
		private var ImgHeadBJ:Class;
		[Embed(source="res/hud_head_ss.png")]
		private var ImgHeadSS:Class;

		public var back:FlxSprite;
		public var head:FlxSprite;
		public var player:Player;
		public var life:FlxSprite;
		//public var mana:FlxSprite;

		public function HUDPlayer(index:int){
			super();
			x = 20 + 120 * index;
			y = 20;
			switch (index){
				case 0:
					player = PlayState.playerSZ;
					head = new FlxSprite(0, 0, ImgHeadSZ);
					break;
				case 1:
					player = PlayState.playerWK;
					head = new FlxSprite(0, 0, ImgHeadWK);
					break;
				case 2:
					player = PlayState.playerBJ;
					head = new FlxSprite(0, 0, ImgHeadBJ);
					break;
				case 3:
					player = PlayState.playerSS;
					head = new FlxSprite(0, 0, ImgHeadSS);
					break;
			}
			back = new FlxSprite(0, 0, ImgBack);
			add(back);
			
			add(head);
			
			life = new FlxSprite(35, 30);
			life.createGraphic(60, 4);
			life.fill(0xffffff00);
			life.origin.x = 0;
			add(life);
		}
		
		public function updateLife():void {
			life.scale.x = player.health / player.healthMax;
		}
	}
}