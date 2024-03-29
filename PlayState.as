package {
	import org.flixel.*;

	public class PlayState extends FlxState {
		[Embed(source="res/gibs_bullet.png")]
		private var ImgGibsBullet:Class;
		[Embed(source="res/gibs_enemy.png")]
		private var ImgGibsEnemy:Class;
		[Embed(source="res/back.gif")]
		private var ImgBack:Class;
		[Embed(source="res/back_hud.gif")]
		private var ImgBackHUD:Class;

		public static var players:FlxGroup;
		public static var playerWK:PlayerWK;
		public static var playerSZ:PlayerSZ;
		public static var playerBJ:PlayerBJ;
		public static var playerSS:PlayerSS;
		public static var playerNow:int;

		public static var gibsBullet:FlxEmitter;
		public static var gibsEnemy:FlxEmitter;

		public static var bulletsPlayer:FlxGroup;
		public static var bulletsPlayerWK:FlxGroup;
		public static var bulletsPlayerSZ:FlxGroup;
		public static var bulletsPlayerBJ:FlxGroup;
		public static var bulletsPlayerSS:FlxGroup;
		public static var bulletsEnemy:FlxGroup;
		public static var bulletsEnemy1:FlxGroup;

		public static var back:FlxSprite;
		public static var backHUD:FlxSprite;
		
		public static var tag:Tag;

		public static var hudSZ:HUDPlayer;
		public static var hudWK:HUDPlayer;
		public static var hudBJ:HUDPlayer;
		public static var hudSS:HUDPlayer;

		public var enemies:FlxGroup;
		public var enemyList:Array;
		public var enemyCount:int;

		protected var backNear:FlxGroup;
		protected var backFar:FlxGroup;
		//protected var fore:FlxSprite;

		protected var timer:Number;
		protected var timerLast:Number;

		public function PlayState():void {
			init();

			// back
			add(back);
			backFar = new FlxGroup();
			add(backFar);
			backNear = new FlxGroup();
			add(backNear);

			// bullets
			add(bulletsEnemy);
			add(bulletsPlayerWK);
			add(bulletsPlayerSZ);
			add(bulletsPlayerBJ);
			add(bulletsPlayerSS);

			// player
			playerSZ.refresh();
			playerWK.refresh();
			playerBJ.refresh();
			playerSS.refresh();
			players.add(playerSS);
			players.add(playerBJ);
			players.add(playerWK);
			players.add(playerSZ);
			add(players);

			// enemies
			enemies = new FlxGroup();
			add(enemies);

			// emitter
			add(gibsBullet);
			add(gibsEnemy);

			// fore
			//fore = new FlxSprite();
			//fore.exists = false;
			//add(fore);

			// hud
			add(backHUD);

			//hudSZ.updateLife();
			//hudWK.updateLife();
			//hudBJ.updateLife();
			//hudSS.updateLife();

			add(hudSS);
			add(hudBJ);
			add(hudWK);
			add(hudSZ);
			
			add(tag);

			playerNow = 0;
			timer = 0;
			timerLast = 0;
			enemyCount = 0;

			//var tt:ZhText = new ZhText();
			//tt.text = "啊多会能发"
			//addChild(tt);
		}

		public function init():void {
			back = new FlxSprite(0, 0, ImgBack);
			backHUD = new FlxSprite(0, 0, ImgBackHUD);
			
			tag = new Tag();

			var s:FlxSprite;
			var i:int;
			bulletsPlayerWK = new FlxGroup();
			for (i = 0; i < 32; i++){
				s = new BulletPlayerWK();
				bulletsPlayerWK.add(s);
			}
			bulletsPlayerSZ = new FlxGroup();
			for (i = 0; i < 32; i++){
				s = new BulletPlayerSZ();
				bulletsPlayerSZ.add(s);
			}
			bulletsPlayerBJ = new FlxGroup();
			for (i = 0; i < 32; i++){
				s = new BulletPlayerBJ();
				bulletsPlayerBJ.add(s);
			}
			bulletsPlayerSS = new FlxGroup();
			for (i = 0; i < 32; i++){
				s = new BulletPlayerSS();
				bulletsPlayerSS.add(s);
			}
			bulletsPlayer = new FlxGroup();
			bulletsPlayer.add(bulletsPlayerWK);
			bulletsPlayer.add(bulletsPlayerSZ);
			bulletsPlayer.add(bulletsPlayerBJ);
			bulletsPlayer.add(bulletsPlayerSS);

			bulletsEnemy1 = new FlxGroup();
			for (i = 0; i < 64; i++){
				s = new BulletEnemy1();
				bulletsEnemy1.add(s);
			}
			bulletsEnemy = new FlxGroup();
			bulletsEnemy.add(bulletsEnemy1);

			gibsBullet = new FlxEmitter();
			gibsBullet.setXSpeed(-300, 300);
			gibsBullet.setYSpeed(-300, 300);
			gibsBullet.gravity = 1000;
			gibsBullet.particleDrag.x = 100;
			gibsBullet.particleDrag.y = 100;
			gibsBullet.createSprites(ImgGibsBullet, 100, 0);
			gibsEnemy = new FlxEmitter();
			gibsEnemy.setXSpeed(-300, 300);
			gibsEnemy.setYSpeed(-300, 300);
			gibsEnemy.gravity = 0;
			gibsEnemy.particleDrag.x = 100;
			gibsEnemy.particleDrag.y = 100;
			gibsEnemy.createSprites(ImgGibsEnemy, 100, 0);

			players = new FlxGroup();
			playerWK = new PlayerWK();
			playerSZ = new PlayerSZ();
			playerBJ = new PlayerBJ();
			playerSS = new PlayerSS();

			hudSZ = new HUDPlayer(0);
			hudWK = new HUDPlayer(1);
			hudBJ = new HUDPlayer(2);
			hudSS = new HUDPlayer(3);
		}

		override public function update():void {
			if (FlxG.keys.ONE){
				playerNow = 0;
			}
			if (FlxG.keys.TWO){
				playerNow = 1;
			}
			if (FlxG.keys.THREE){
				playerNow = 2;
			}
			if (FlxG.keys.FOUR){
				playerNow = 3;
			}
			if (FlxG.keys.justPressed("Q")){
				playerNow = (playerNow + 3) % 4;
			}
			if (FlxG.keys.justPressed("E")){
				playerNow = (playerNow + 1) % 4;
			}

			super.update();

			FlxU.overlap(bulletsPlayer, enemies, overlapped);
			FlxU.overlap(bulletsEnemy, players, overlapped);

			timer += FlxG.elapsed;
			addEnemy();
			timerLast = timer;

			//backFar.x -= FlxG.elapsed * 10;
			//backNear.x -= FlxG.elapsed * 20;
			//back.x -= FlxG.elapsed * 20;
			//fore.x -= FlxG.elapsed * 150;

		}

		protected function overlapped(Object1:FlxObject, Object2:FlxObject):void {
			if (Object1 is BulletPlayer){
				Object2.hurt((Object1 as BulletPlayer).damage);
			}
			if (Object1 is BulletEnemy){
				Object2.hurt((Object1 as BulletEnemy).damage);
			}
			Object1.kill();
		}

		protected function addEnemy():void {
			// to be overridden
		}

		public function changePlayer():void {
			//switch (playerNow) {
			//case 0:
			//hudSZ.
			//break;
			//}
		}
	}
}