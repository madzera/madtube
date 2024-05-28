import 'package:http/http.dart' as http;
import 'package:madtube/common/constant.dart';
import 'dart:convert';

import '../../model/video.dart';

class SearchAPI {

  Future<List<Video>> execute(String arg) async {
    List<Video> videos = [];

    http.Response response = await http.get(Uri.parse(
      Constant.urlBase + "search"
          "?part=snippet"
          "&type=video"
          "&maxResult=20"
          "&order=date"
          "&key=${Constant.key}"
          "&channelId=${Constant.channelId}"
          "&q=$arg"
    ));

    if (response.statusCode == 200) {
      Map<String, dynamic> mapDecoded = json.decode(response.body);

      for (dynamic obj in mapDecoded["items"]) {
        final String videoId = obj["id"]["videoId"];
        final String title = obj["snippet"]["title"];
        final String imgURL = obj["snippet"]["thumbnails"]["high"]["url"];
        final String channelId = obj["snippet"]["channelTitle"];
        final String description = obj["snippet"]["description"];

        Video video = Video(videoId, title, imgURL, channelId, description);
        videos.add(video);
      }

    } else {

    }
    return videos;
  }
}