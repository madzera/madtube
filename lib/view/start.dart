import 'package:flutter/material.dart';
import 'package:madtube/service/api_facade.dart';
import 'package:madtube/model/video.dart';

class StartPage extends StatefulWidget {
  final String _searchQuery;

  const StartPage(this._searchQuery, {super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  Future<List<Video>> _listVideos(String q) {
    APIFacade api = APIFacade();
    return api.search(q);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listVideos(widget._searchQuery),
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
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(video.image)
                              )
                          ),
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
                itemCount: snapshot.data!.length
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
}
