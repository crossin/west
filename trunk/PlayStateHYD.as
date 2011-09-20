package {
	import org.flixel.*;

	public class PlayStateHYD extends PlayState {
		[Embed(source="res/back_hyd_f1.png")]
		private var ImgFar1:Class;
		[Embed(source="res/back_hyd_f2.png")]
		private var ImgFar2:Class;
		[Embed(source="res/back_hyd_f3.png")]
		private var ImgFar3:Class;
		[Embed(source="res/back_hyd_f4.png")]
		private var ImgFar4:Class;
		[Embed(source="res/back_hyd_n1.png")]
		private var ImgNear1:Class;
		[Embed(source="res/back_hyd_n2.png")]
		private var ImgNear2:Class;
		[Embed(source="res/back_hyd_n3.png")]
		private var ImgNear3:Class;
		[Embed(source="res/back_hyd_n4.png")]
		private var ImgNear4:Class;
		[Embed(source="res/back_hyd_n5.png")]
		private var ImgNear5:Class;
		[Embed(source="res/back_hyd_n6.png")]
		private var ImgNear6:Class;


		public function PlayStateHYD():void {
			super();

			backFar.add(new BackGround(ImgFar1, true));
			backFar.add(new BackGround(ImgFar2, true));
			backFar.add(new BackGround(ImgFar3, true));
			backFar.add(new BackGround(ImgFar4, true));
			backNear.add(new BackGround(ImgNear1));
			backNear.add(new BackGround(ImgNear2));
			backNear.add(new BackGround(ImgNear3));
			backNear.add(new BackGround(ImgNear4));
			backNear.add(new BackGround(ImgNear5));
			backNear.add(new BackGround(ImgNear6));

			enemyList = [[1, Enemy1, 650, 50], 
						 [1.2, Enemy1, 650, 100], 
						 [1.4, Enemy1, 650, 150], 
						 [1.6, Enemy1, 650, 200], 
						 [1.8, Enemy1, 650, 250], 
						 [2, Enemy1, 650, 300], 
						 [4, Enemy2, 300, -150], 
						 [4.4, Enemy2, 350, -150], 
						 [4.8, Enemy2, 400, -150], 
						 [6, Enemy2, 300, 500], 
						 [6.4, Enemy2, 350, 500], 
						 [6.8, Enemy2, 400, 500], 
						 [9, Enemy3, 650, 200], 
						 [13, Enemy4, 650, 200], 
						 ];
		}

		//override public function update():void {
		//super.update();
		//}

		override protected function addEnemy():void {
			//if (timer % 4 < timerLast % 4) {
			//enemies.add(new EnemyXY());
			//}
			while (enemyCount < enemyList.length && timer >= enemyList[enemyCount][0] && timerLast < enemyList[enemyCount][0]){
				enemies.add(new enemyList[enemyCount][1](enemyList[enemyCount][2],enemyList[enemyCount][3]));
				enemyCount++;
			}
		}
	}
}