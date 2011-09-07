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
		}

		//override public function update():void {
		//super.update();
		//}

		override protected function addEnemy():void {
			//if (timer % 4 < timerLast % 4) {
			//enemies.add(new EnemyXY());
			//}
			if (timer >= 2 && timerLast < 2){
				enemies.add(new EnemyXY());
			}
		}
	}
}