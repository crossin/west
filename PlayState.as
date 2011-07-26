package {
	import org.flixel.*;

	public class PlayState extends FlxState {
		public var players:FlxGroup;
		public var playerWK:PlayerWK;
		public var playerSZ:PlayerSZ;
		public var playerNow:Player;
		
		public function PlayState():void {
			// player
			players = new FlxGroup();
			playerWK = new PlayerWK();
			playerSZ = new PlayerSZ();
			players.add(playerWK);
			players.add(playerSZ);
			add(players);
			
			playerNow = playerSZ;
		}
	}
}