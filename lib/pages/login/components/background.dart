import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Shimmer(
      child: Container(
        color: Color(0xff415870),
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[child],
        ),
      ),
    );
  }
}
