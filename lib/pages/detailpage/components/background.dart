import 'package:flutter/material.dart';
import 'package:movie_witchuu/models/movie.dart';

class Background extends StatelessWidget {
  final Widget child;
  Movie movie;

  Background(this.child, this.movie);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -40,
            right: 0,
            child: SizedBox(
              child: Image.asset(
                "assets/movies/" + '${movie.poster}',
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}
