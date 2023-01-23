class PixelApi {
  final List<Photo> photos;

  PixelApi({required this.photos});

  factory PixelApi.fromJson(Map<String, dynamic> json) {
    return PixelApi(
      photos: List<Photo>.from(json['photos'].map((x) => Photo.fromJson(x))),
    );
  }
}

class Photo {
  final PhotoType src;

  Photo({required this.src});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      src: PhotoType.fromJson(json['src']),
    );
  }
}

class PhotoType {
  final String medium;

  PhotoType({required this.medium});

  factory PhotoType.fromJson(Map<String, dynamic> json) {
    return PhotoType(
      medium: json['medium'],
    );
  }
}
