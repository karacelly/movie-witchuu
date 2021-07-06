import 'package:movie_witchuu/models/review.dart';

class Movie {
  int id;
  String name;
  String desc;
  List<Review> reviews;
  String poster;

  Movie(this.id, this.name, this.desc, this.reviews, this.poster);
}
