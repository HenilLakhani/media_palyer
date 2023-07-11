import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../utils/song_utils.dart';

class AudioController extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration totalDuration = Duration.zero;

  AudioController() {
    assetsAudioPlayer
        .open(Audio(audioPath + Myaudios.gori_radha), autoStart: false)
        .then((value) {
      totalDuration = assetsAudioPlayer.current.value!.audio.duration;
    });
  }
  play() async {
    await assetsAudioPlayer.play();
    notifyListeners();
  }

  seek({required int seconds}) async {
    await assetsAudioPlayer.seek(
      Duration(seconds: seconds),
    );
    notifyListeners();
  }

  skip({required int seconds}) async {
    await assetsAudioPlayer.seekBy(
      Duration(seconds: seconds),
    );
    notifyListeners();
  }

  pause() async {
    await assetsAudioPlayer.pause();
    notifyListeners();
  }

  get idPlaying {
    return assetsAudioPlayer.isPlaying.value;
  }

  get currentPosition {
    return assetsAudioPlayer..currentPosition;
  }
}
