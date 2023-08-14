import 'package:audioplayers/audioplayers.dart';

//* Initializes the Audioplayers Plugin
//and holds the Attributes to play the Click-Sound
//*
class AudioPlay {
  //The audio source
  String src = 'audio/click.wav';

  //The AudioPlayer Class from AudioPlayers
  final player = AudioPlayer();

//Starts the Player and wait till everything is loading.
  Future<void> playClick() async {
    await player.play(AssetSource(src));
  }

//Stops the Player
  muteClick() async {
    player.stop();
    //
  }

//Pause the Player
  pauseClick() {
    player.pause();
  }

//Resume the Player
  Future<void> resumeClick() => player.resume();

  disposeClick() => player.dispose();
}
