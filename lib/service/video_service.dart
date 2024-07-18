import 'package:madtube/service/api/search_api_client.dart';

import '../model/video.dart';

class VideoService {

  Future<List<Video>> search(String query) {
    VideoIntegration searchAPI = VideoIntegration();
    return searchAPI.execute(query);
  }
}