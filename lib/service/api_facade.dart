import 'package:madtube/service/api/search_api.dart';

import '../model/video.dart';

class APIFacade {

  Future<List<Video>> search(String query) {
    SearchAPI searchAPI = SearchAPI();
    return searchAPI.execute(query);
  }
}