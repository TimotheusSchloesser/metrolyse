import 'package:audioplayers/audioplayers.dart';

//* Initializes the Audioplayers Plugin
//and holds the Attributes to play the Click-Sound
//
class AudioPlay {
  //The audio source
  String src = 'audio/click.wav';

  //The AudioPlayer Class from AudioPlayers
  final player = AudioPlayer();

//Starts the Player and wait till everything is loading.
  Future<void> playClick() async =>
      await player.play(AssetSource(src), mode: PlayerMode.lowLatency);

//Stops the Player
  muteClick() => player.stop();
}
