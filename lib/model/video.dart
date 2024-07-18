import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video {
  final String _id;
  final String _title;
  final String _image;
  final String _channel;
  final String _description;
  final YoutubePlayerController _videoController;

  Video(this._id, this._title, this._image, this._channel, this._description) :
      _videoController = YoutubePlayerController(
        initialVideoId: _id,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
          showLiveFullscreenButton: true
        ),
      );

  String get id => _id;
  String get title => _title;
  String get image => _image;
  String get channel => _channel;
  String get description => _description;
  YoutubePlayerController get videoController => _videoController;
}