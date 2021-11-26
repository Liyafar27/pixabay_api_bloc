class ImagePixabay {
  String largeImageURL;
  int webformatHeight;
  int webformatWidth;
  int likes;
  int imageWidth;
  int id;
  int userId;
  int views;
  int comments;
  String pageURL;
  int imageHeight;
  String webformatURL;
  String type;
  int previewHeight;
  String tags;
  int downloads;
  String user;
  int favorites;
  int imageSize;
  int previewWidth;
  String userImageURL;
  String previewURL;


  ImagePixabay({
    required this.largeImageURL,
    required this.webformatHeight,
    required this.webformatWidth,
    required this.likes,
    required this.imageWidth,
    required this.id,
    required this.userId,
    required this.views,
    required this.comments,
    required this.pageURL,
    required this.imageHeight,
    required this.webformatURL,
    required this.type,
    required this.previewHeight,
    required this.tags,
    required this.downloads,
    required this.user,
    required this.favorites,
    required this.imageSize,
    required this.previewWidth,
    required this.userImageURL,
    required this.previewURL
  });

  factory ImagePixabay.fromJson(Map<String, dynamic> json) {
    return ImagePixabay(
      largeImageURL : json['largeImageURL'],
      webformatHeight : json['webformatHeight'],
      webformatWidth : json['webformatWidth'],
      likes : json['likes'],
      imageWidth : json['imageWidth'],
      id : json['id'],
      userId : json['user_id'],
      views : json['views'],
      comments : json['comments'],
      pageURL : json['pageURL'],
      imageHeight : json['imageHeight'],
      webformatURL : json['webformatURL'],
      type : json['type'],
      previewHeight : json['previewHeight'],
      tags : json['tags'],
      downloads : json['downloads'],
      user : json['user'],
      favorites : json['favorites'],
      imageSize : json['imageSize'],
      previewWidth : json['previewWidth'],
      userImageURL : json['userImageURL'],
      previewURL : json['previewURL'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['largeImageURL'] = this.largeImageURL;
    data['webformatHeight'] = this.webformatHeight;
    data['webformatWidth'] = this.webformatWidth;
    data['likes'] = this.likes;
    data['imageWidth'] = this.imageWidth;
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['views'] = this.views;
    data['comments'] = this.comments;
    data['pageURL'] = this.pageURL;
    data['imageHeight'] = this.imageHeight;
    data['webformatURL'] = this.webformatURL;
    data['type'] = this.type;
    data['previewHeight'] = this.previewHeight;
    data['tags'] = this.tags;
    data['downloads'] = this.downloads;
    data['user'] = this.user;
    data['favorites'] = this.favorites;
    data['imageSize'] = this.imageSize;
    data['previewWidth'] = this.previewWidth;
    data['userImageURL'] = this.userImageURL;
    data['previewURL'] = this.previewURL;
    return data;
  }
}