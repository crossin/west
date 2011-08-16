package {
	import org.flixel.*;

	public class PlayState extends FlxState {
		[Embed(source="res/gibs_bullet.png")]
		private var ImgGibsBullet:Class;
		[Embed(source="res/gibs_enemy.png")]
		private var ImgGibsEnemy:Class;
		[Embed(source="res/back.png")]
		private var ImgBack:Class;
		
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
		
		public var enemies:FlxGroup;
		public var back:FlxSprite;
		
		protected var backNear:FlxSprite;
		protected var backFar:FlxSprite;
		protected var fore:FlxSprite;
		
		protected var timer:Number;
		protected var timerLast:Number;

		public function PlayState():void {
			init();
			
			// back
			back = new FlxSprite(0, 0, ImgBack);
			add(back);
			backFar = new FlxSprite();
			add(backFar);
			backNear = new FlxSprite();
			add(backNear);
			
			// bullets
			add(bulletsEnemy);
			add(bulletsPlayerWK);
			add(bulletsPlayerSZ);
			add(bulletsPlayerBJ);
			add(bulletsPlayerSS);
			
			// player
			players.add(playerWK);
			players.add(playerSZ);
			players.add(playerBJ);
			players.add(playerSS);
			add(players);
			
			// enemies
			enemies = new FlxGroup();
			add(enemies);
			
			// emitter
			add(gibsBullet);
			add(gibsEnemy);
			
			// fore
			fore = new FlxSprite();
			fore.exists = false;
			add(fore);
			
			playerNow = 0;
			timer = 0;
			timerLast = 0;
			

			//var tt:ZhText = new ZhText();
			//tt.text = "啊多会能发"
			//addChild(tt);
		}
		
		public function init():void {
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
			
			bulletsEnemy = new FlxGroup();
			for (i = 0; i < 64; i++){
				s = new BulletEnemy();
				bulletsEnemy.add(s);
			}
			
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
		}

		override public function update():void {
			if (FlxG.keys.ONE){
				playerNow = 0;
			}
			if (FlxG.keys.TWO){
				playerNow = 1;
			}
			if (FlxG.keys.justPressed("Q")){
				playerNow = (playerNow + 3) % 4;
			}
			if (FlxG.keys.justPressed("E")){
				playerNow = (playerNow + 1) % 4;
			}
			
			super.update();
			
			FlxU.overlap(bulletsPlayer, enemies, overlapped);
			
			timer += FlxG.elapsed;
			addEnemy();
			timerLast = timer;
			
			backFar.x -= FlxG.elapsed * 20;
			backNear.x -= FlxG.elapsed * 50;
			fore.x -= FlxG.elapsed * 150;
			
		}
		
		protected function overlapped(Object1:FlxObject, Object2:FlxObject):void {
			Object1.kill();
			//Object2.kill();
		}
		
		protected function addEnemy():void {
			// to be overridden
		}
	}
}