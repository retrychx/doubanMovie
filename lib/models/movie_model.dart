class MovieModel {
  int count;
  int start;
  int total;
  List<Subject> subjects;
  String title;

  MovieModel({this.count, this.start, this.total, this.subjects, this.title});

  MovieModel.fromJson(Map<String, dynamic> json) {
    count = json['count'] as int;
    start = json['start'] as int;
    total = json['total'] as int;
    subjects = (json['subjects'] as List)
        .map((value) => Subject.fromJson(value))
        .toList();
    title = json['title'];
  }
}

class Subject {
  Rating rating;
  List<String> genres;
  String title;
  List<Director> casts;
  List<String> durations;
  int collect_count;
  String mainland_pubdate;
  bool has_video;
  String original_title;
  String subtype;
  List<Director> directors;
  List<String> pubdates;
  String year;
  ImageModel images;
  String alt;
  String id;

  Subject(
      {this.rating,
      this.genres,
      this.title,
      this.casts,
      this.durations,
      this.collect_count,
      this.mainland_pubdate,
      this.has_video,
      this.original_title,
      this.subtype,
      this.directors,
      this.pubdates,
      this.year,
      this.images,
      this.alt,
      this.id});

  Subject.fromJson(Map<String, dynamic> json) {
    rating = Rating.fromJson(json['rating']);
    genres = json['genres'].cast<String>();
    title = json['title'];
    casts = (json['casts'] as List)?.map((e) => Director.fromJson(e)).toList();
    durations = json['durations'].cast<String>();
    collect_count = json['collect_count'] as int;
    mainland_pubdate = json['mainland_pubdate'];
    has_video = json['has_video'] as bool;
    original_title = json['original_title'];
    subtype = json['subtype'];
    directors =
        (json['directors'] as List)?.map((e) => Director.fromJson(e)).toList();
    pubdates = json['pubdates'].cast<String>();
    year = json['year'];
    images = ImageModel.fromJson(json['images']);
    alt = json['alt'];
    id = json['id'];
  }
}

class Rating {
  int max;
  double average;
  Map<String, double> details;
  String stars;
  int min;

  Rating({this.max, this.average, this.details, this.stars, this.min});

  Rating.fromJson(Map json) {
    max = json['max'] as int;
    average = (json['average'] as num)?.toDouble();
    details = (json['details'] as Map<String, dynamic>)
        ?.map((k, e) => MapEntry(k, (e as num)?.toDouble()));
    stars = json['stars'];
    min = json['min'] as int;
  }
}

class Avatars {
  String small;
  String large;
  String medium;

  Avatars({this.small, this.large, this.medium});

  Avatars.fromJson(Map json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }
}

class ImageModel {
  String small;
  String large;
  String medium;

  ImageModel({this.small, this.large, this.medium});

  ImageModel.fromJson(Map json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }
}

class Director {
  Avatars avatars;
  String nameEn;
  String name;
  String alt;
  String id;

  Director({this.avatars, this.nameEn, this.name, this.alt, this.id});

  Director.fromJson(Map<String, dynamic> json) {
    avatars = Avatars.fromJson(json['avatars']);
    nameEn = json['name_en'];
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
  }
}
