import 'package:douban/models/movie_model.dart';

class MovieDetaiModel {
  Rating rating;
  int reviews_count;
  List<String> videos;
  int wish_count;
  String original_title;
  List<String> blooper_urls;
  int collect_count;
  ImageModel images;
  String douban_site;
  String year;
  List<PopularComment> popular_comments;
  String alt;
  String id;
  String mobile_url;
  int photos_count;
  String pubdate;
  String title;
  int do_count;
  bool has_video;
  String share_url;
  int seasons_count;
  List<String> languages;
  String schedule_url;
  List<Director> writers;
  List<String> pubdates;
  String website;
  List<String> tags;
  bool has_schedule;
  List<String> durations;
  List<String> genres;
  String collection;
  List<Trailer> trailers;
  int episodes_count;
  List<String> trailer_urls;
  bool has_ticket;
  List<String> bloopers;
  List<String> clip_urls;
  int current_season;
  List<Director> casts;
  List<String> countries;
  String mainland_pubdate;
  List<Photo> photos;
  String summary;
  List<String> clips;
  String subtype;
  List<Director> directors;
  int comments_count;
  List<PopularReview> popular_reviews;
  int ratings_count;
  List<String> aka;

  MovieDetaiModel(
      {this.rating,
      this.reviews_count,
      this.videos,
      this.wish_count,
      this.original_title,
      this.blooper_urls,
      this.collect_count,
      this.images,
      this.douban_site,
      this.year,
      this.popular_comments,
      this.alt,
      this.id,
      this.mobile_url,
      this.photos_count,
      this.pubdate,
      this.title,
      this.do_count,
      this.has_video,
      this.share_url,
      this.seasons_count,
      this.languages,
      this.schedule_url,
      this.writers,
      this.pubdates,
      this.website,
      this.tags,
      this.has_schedule,
      this.durations,
      this.genres,
      this.collection,
      this.trailers,
      this.episodes_count,
      this.trailer_urls,
      this.has_ticket,
      this.bloopers,
      this.clip_urls,
      this.current_season,
      this.casts,
      this.countries,
      this.mainland_pubdate,
      this.photos,
      this.summary,
      this.clips,
      this.subtype,
      this.directors,
      this.comments_count,
      this.popular_reviews,
      this.ratings_count,
      this.aka});

  MovieDetaiModel.fromJson(Map<String, dynamic> json) {
    rating = json['rating'] == null ? null : Rating.fromJson(json['rating']);
    reviews_count = json['reviews_count'] as int;
    videos = json['videos'].cast<String>();
    wish_count = json['wish_count'] as int;
    original_title = json['original_title'];
    bloopers = json['bloopers'].cast<String>();
    collect_count = json['collect_count'] as int;
    images = json['image'] == null ? null : ImageModel.fromJson(json['image']);
    douban_site = json['douban_site'];
    year = json['year'];
    popular_comments = (json['popular_comments'] as List)
        ?.map((e) => PopularComment.fromJson(e))
        .toList();
    alt = json['alt'];
    id = json['id'];
    mobile_url = json['mobile_url'];
    photos_count = json['photos_count'] as int;
    pubdate = json['pubdate'];
    title = json['title'];
    do_count = json['do_count'] as int;
    has_video = json['has_video'] as bool;
    share_url = json['share_url'];
    writers =
        (json['writers'] as List)?.map((e) => Director.fromJson(e)).toList();
    pubdates = json['pubdates'].cast<String>();
    website = json['website'];
    tags = json['tags'].cast<String>();
    has_schedule = json['has_schedule'] as bool;
    durations = json['durations'].cast<String>();
    genres = json['genres'].cast<String>();
    collection = json['collection'];
    trailers =
        (json['trailers'] as List)?.map((e) => Trailer.fromJson(e)).toList();
    episodes_count = json['episodes_count'] as int;
    trailer_urls = json['trailer_urls'].cast<String>();
    has_ticket = json['has_ticket'] as bool;
    bloopers = json['bloopers'].cast<String>();
    clip_urls = json['clip_urls'].cast<String>();
    current_season = json['current_season'] as int;
    casts = (json['casts'] as List)?.map((e) => Director.fromJson(e)).toList();
    countries = json['countries'].cast<String>();
    mainland_pubdate = json['mainland_pubdate'];
    photos = (json['photos'] as List)?.map((e) => Photo.fromJson(e)).toList();
    summary = json['summary'];
    clips = json['clips'].cast<String>();
    subtype = json['subtype'];
    directors =
        (json['directors'] as List)?.map((e) => Director.fromJson(e)).toList();
    comments_count = json['comments_count'] as int;
    popular_reviews = (json['popular_reviews'] as List)
        ?.map((e) => PopularReview.fromJson(e))
        .toList();
    ratings_count = json['ratings_count'] as int;
    aka = json['aka'].cast<String>();
  }
}

class Photo {
  String thumb;
  String image;
  String cover;
  String alt;
  String id;
  String icon;

  Photo({this.thumb, this.image, this.cover, this.alt, this.id, this.icon});

  Photo.fromJson(Map json) {
    thumb = json['thumb'];
    image = json['image'];
    cover = json['cover'];
    alt = json['alt'];
    id = json['id'];
    icon = json['icon'];
  }
}

class PopularReview {
  Value rating;
  String title;
  String subject_id;
  Author author;
  String summary;
  String alt;
  String id;

  PopularReview(
      {this.rating,
      this.title,
      this.subject_id,
      this.author,
      this.summary,
      this.alt,
      this.id});

  PopularReview.fromJson(Map<String, dynamic> json) {
    rating = json['rating'] == null ? null : Value.fromJson(json['rating']);
    title = json['title'];
    subject_id = json['subject_id'];
    author = json['author'] == null ? null : Author.fromJson(json['author']);
    summary = json['summary'];
    alt = json['alt'];
    id = json['id'];
  }
}

class Trailer {
  String medium;
  String title;
  String subject_id;
  String alt;
  String small;
  String resource_url;
  String id;

  Trailer(
      {this.medium,
      this.title,
      this.subject_id,
      this.alt,
      this.small,
      this.resource_url,
      this.id});

  Trailer.fromJson(Map json) {
    medium = json['medium'];
    title = json['title'];
    subject_id = json['subject_id'];
    alt = json['alt'];
    small = json['small'];
    resource_url = json['resource_url'];
    id = json['id'];
  }
}

class PopularComment {
  Value rating;
  int useful_count;
  Author author;
  String subject_id;
  String content;
  String created_at;
  String id;

  PopularComment(
      {this.rating,
      this.useful_count,
      this.author,
      this.subject_id,
      this.content,
      this.created_at,
      this.id});

  PopularComment.fromJson(Map<String, dynamic> json) {
    rating = json['Value'] == null ? null : Value.fromJson(json['rating']);
    useful_count = json['useful_count'] as int;
    author = json['author'] == null ? null : Author.fromJson(json['author']);
    subject_id = json['subject_id'];
    content = json['content'];
    created_at = json['created_at'];
    id = json['id'];
  }
}

class Value {
  int max;
  double value;
  int min;

  Value({this.max, this.value, this.min});

  Value.fromJson(Map json) {
    max = json['max'] as int;
    value = (json['value']).toDouble();
    min = json['min'] as int;
  }
}

class Author {
  String uid;
  String avatar;
  String signature;
  String alt;
  String id;
  String name;

  Author({this.uid, this.avatar, this.signature, this.alt, this.id, this.name});

  Author.fromJson(Map json) {
    uid = json['uid'];
    avatar = json['avatar'];
    signature = json['signature'];
    alt = json['alt'];
    id = json['id'];
    name = json['name'];
  }
}
