package {
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author crossin
	 */
	public class HUDPlayer extends FlxGroup {
		//[Embed(source="res/hud_back.png")]
		//private var ImgBack:Class;
		[Embed(source="res/hud_sz.png")]
		private var ImgSZ:Class;
		[Embed(source="res/hud_wk.png")]
		private var ImgWK:Class;
		[Embed(source="res/hud_bj.png")]
		private var ImgBJ:Class;
		[Embed(source="res/hud_ss.png")]
		private var ImgSS:Class;

		public var back:FlxSprite;
		//public var head:FlxSprite;
		public var player:Player;
		public var playerLife:Number;
		public var life:FlxSprite;
		//public var mana:FlxSprite;
		public var index:int;
		public var chosen:Boolean;

		public function HUDPlayer(i:int){
			super();
			index = i;
			x = 160 * index;
			y = 400;
			switch (index){
				case 0:
					player = PlayState.playerSZ;
					back = new FlxSprite(0, 0, ImgSZ);
					break;
				case 1:
					player = PlayState.playerWK;
					back = new FlxSprite(0, 0, ImgWK);
					break;
				case 2:
					player = PlayState.playerBJ;
					back = new FlxSprite(0, 0, ImgBJ);
					break;
				case 3:
					player = PlayState.playerSS;
					back = new FlxSprite(0, 0, ImgSS);
					break;
			}
			//back = new FlxSprite(0, 0, ImgBack);
			back.alpha = 0.7;
			add(back);
			
			//add(head);
			
			life = new FlxSprite(60, 30);
			life.createGraphic(80, 4);
			life.fill(0xffff7777);
			life.origin.x = 0;
			life.alpha = 0.7;
			add(life);
			
			playerLife = 0;
			chosen = false;
		}
		
		override public function update():void 
		{
			// life
			if (playerLife != player.health) {
				playerLife = player.health;
				life.scale.x = playerLife / player.healthMax;
			}
			
			// show
			if (!chosen && index == PlayState.playerNow) {
				chosen = true;
				back.alpha = 1;
				life.alpha = 1;
			}
			if (chosen && index != PlayState.playerNow) {
				chosen = false;
				back.alpha = 0.7;
				life.alpha = 0.7;
			}
			
			super.update();
		}
		
	}
}