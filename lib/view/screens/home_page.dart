import 'package:flutter/material.dart';
import 'package:media_player/view/screens/song_page.dart';
import 'package:media_player/view/screens/video_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabcontroller;

  @override
  void initState() {
    super.initState();

    tabcontroller = TabController(
      length: 3,
      vsync: this,
      animationDuration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "media boster",
        ),
        bottom: TabBar(
          controller: tabcontroller,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.music_note_sharp,
                    ),
                    Text("song")
                  ],
                ),
              ),
            ),
            const Tab(
              text: "Videos",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabcontroller,
        children: const [
          SongPage(),
          Videopage(),
        ],
      ),
    );
  }
}
