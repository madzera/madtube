class Video {
  final String _id;
  final String _title;
  final String _image;
  final String _channel;
  final String _description;

  Video(this._id, this._title, this._image, this._channel, this._description);

  String get id => _id;
  String get title => _title;
  String get image => _image;
  String get channel => _channel;
  String get description => _description;
}