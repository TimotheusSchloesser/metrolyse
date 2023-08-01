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
  Future<void> playClick() async {
    //  final player = AudioPlayer();
    await player.play(AssetSource(src));
    // await player.play(AssetSource(src), mode: PlayerMode.lowLatency);
  }

//Stops the Player
  muteClick() async {
    player.stop();
    //
  }

  pauseClick() {
    player.pause();
  }

  Future<void> resumeClick() => player.resume();

  disposeClick() => player.dispose();
}
