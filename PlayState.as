package {
	import org.flixel.*;

	public class PlayState extends FlxState {
		public var players:FlxGroup;
		public var playerWK:PlayerWK;
		public var playerSZ:PlayerSZ;
		public var playerNow:int;

		public function PlayState():void {
			// player
			players = new FlxGroup();
			playerWK = new PlayerWK();
			playerSZ = new PlayerSZ();
			players.add(playerWK);
			players.add(playerSZ);
			add(players);

			playerNow = 0;
		}

		override public function update():void {
			if (FlxG.keys.ONE){
				playerNow = 0;
			}
			if (FlxG.keys.TWO){
				playerNow = 1;
			}
			if (FlxG.keys.justPressed("Q")){
				playerNow = (playerNow - 1) % 4;
			}
			if (FlxG.keys.justPressed("E")){
				playerNow = (playerNow + 1) % 4;
			}
			super.update();
		}
	}
}