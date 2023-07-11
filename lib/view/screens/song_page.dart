import 'package:flutter/material.dart';
import 'package:media_player/cantroller/audio_cantroller.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<AudioController>(
        builder: (context, provider, child) {
          return StreamBuilder(
              stream: provider.currentPosition,
              builder: (context, AsyncSnapshot<Duration> snapShot) {
                if (snapShot.hasData) {
                  double currentPosition = snapShot.data!.inSeconds.toDouble();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Slider(
                        min: 0,
                        max: provider.totalDuration.inSeconds.toDouble(),
                        value: currentPosition,
                        onChanged: (val) {
                          provider.seek(seconds: val.toInt());
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "${snapShot.data!.inMinutes}:${snapShot.data!.inSeconds % 60}"),
                          Text(
                              "${provider.totalDuration.inMinutes}:${provider.totalDuration.inSeconds % 60}"),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              provider.play();
                            },
                            icon: const Icon(Icons.play_arrow_outlined),
                          ),
                          IconButton(
                            onPressed: () {
                              provider.pause();
                            },
                            icon: const Icon(Icons.pause),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              });
        },
      ),
    );
  }
}
