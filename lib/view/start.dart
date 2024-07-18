import 'package:flutter/material.dart';
import 'package:madtube/service/video_service.dart';
import 'package:madtube/model/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class StartPage extends StatefulWidget {
  final String _searchQuery;

  const StartPage(this._searchQuery, {super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Future<List<Video>>? videos;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    videos = _listVideos(widget._searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: videos,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              List<Video> videos = snapshot.data == null? [] : snapshot.data!;
              return ListView.separated(
                itemBuilder: (context, index) {
                  Video video = videos[index];
                  return GestureDetector(
                    onTap: () {
                    },
                    child: Column(
                      children: [
                        YoutubePlayer(
                          controller: video.videoController,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.blueAccent
                        ),
                        ListTile(
                          title: Text(video.title),
                          subtitle: Text(video.channel),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 3,
                    color: Colors.grey,
                  );
                },
                itemCount: videos.length
              );
            } else {
              return const Center(
                child: Text("Unavailable."),
              );
            }
        }
      },
    );
  }

  Future<List<Video>> _listVideos(String q) {
    VideoService api = VideoService();
    return api.search(q);
  }

}
