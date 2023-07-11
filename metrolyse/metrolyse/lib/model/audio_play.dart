import 'package:audioplayers/audioplayers.dart';

class AudioPlay {
  click() async {
    const String src = 'audio/click.wav';
    final player = AudioPlayer();
    await player.play(AssetSource(src));
    player.play(AssetSource(src));
  }
}
