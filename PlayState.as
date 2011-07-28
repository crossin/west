package {
	import org.flixel.*;

	public class PlayState extends FlxState {
		[Embed(source="res/gibs_bullet.png")]
		private var ImgGibsBullet:Class;
		[Embed(source="res/gibs_enemy.png")]
		private var ImgGibsEnemy:Class;
		
		public static var players:FlxGroup;
		public static var playerWK:PlayerWK;
		public static var playerSZ:PlayerSZ;
		public static var playerNow:int;
		
		public static var gibsBullet:FlxEmitter;
		public static var gibsEnemy:FlxEmitter;
		
		public static var bulletsPlayer:FlxGroup;
		public static var bulletsPlayerWK:FlxGroup;
		public static var bulletsPlayerSZ:FlxGroup;
		
		public var enemies:FlxGroup;
		
		protected var timer:Number;
		protected var timerLast:Number;

		public function PlayState():void {
			init();
			
			// player
			players.add(playerWK);
			players.add(playerSZ);
			add(players);

			// bullets
			add(bulletsPlayerWK);
			add(bulletsPlayerSZ);
			
			// emitter
			add(gibsBullet);
			add(gibsEnemy);
			
			enemies = new FlxGroup();
			add(enemies);
			
			playerNow = 0;
			timer = 0;
			timerLast = 0;
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
			
			bulletsPlayer = new FlxGroup();
			bulletsPlayer.add(bulletsPlayerWK);
			bulletsPlayer.add(bulletsPlayerSZ);
			
			gibsBullet = new FlxEmitter();
			gibsBullet.setXSpeed(-300, 300);
			gibsBullet.setYSpeed(-300, 300);
			gibsBullet.gravity = 0;
			gibsBullet.particleDrag.x = 100;
			gibsBullet.particleDrag.y = 100;
			gibsBullet.createSprites(ImgGibsBullet, 100, 0, false);
			gibsEnemy = new FlxEmitter();
			gibsEnemy.setXSpeed(-300, 300);
			gibsEnemy.setYSpeed(-300, 300);
			gibsEnemy.gravity = 0;
			gibsEnemy.particleDrag.x = 100;
			gibsEnemy.particleDrag.y = 100;
			gibsEnemy.createSprites(ImgGibsEnemy, 100, 0, false);
			
			players = new FlxGroup();
			playerWK = new PlayerWK();
			playerSZ = new PlayerSZ();
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
		}
		
		protected function overlapped(Object1:FlxObject, Object2:FlxObject):void {
			Object1.kill();
			Object2.kill();
		}
		
		protected function addEnemy():void {
			// to be overridden
		}
	}
}