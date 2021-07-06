import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_witchuu/models/movie.dart';
import 'package:movie_witchuu/models/review.dart';
import 'package:movie_witchuu/pages/detailpage/components/background.dart';
import 'package:movie_witchuu/utils/global.dart' as globals;
import 'package:shimmer_animation/shimmer_animation.dart';

class DetailPage extends StatefulWidget {
  Movie movie;
  DetailPage(this.movie);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailPageState(movie);
  }
}

class DetailPageState extends State<DetailPage> {
  Movie movie;
  DetailPageState(this.movie);
  final _formKey = GlobalKey<FormState>();
  var _reviewController = TextEditingController();
  var _ratingController = TextEditingController();

  Widget _buildWidget(Review review) {
    Size size = MediaQuery.of(context).size;

    return Card(
      color: globals.darkThemeEnabled
          ? globals.darkTheme.primaryColor
          : globals.lightTheme.primaryColor,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    '${review.user.username}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Container(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${review.review.toStringAsFixed(1)}  ',
                          style: TextStyle(
                            color: globals.darkThemeEnabled
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ),
                      ],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              width: size.width,
              child: Text('${review.comment}'),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed(BuildContext ctx, String text, var review) {
    if (text.isEmpty) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text("Please fill the review fiels!"),
        ),
      );
    } else if (review.toString().isEmpty) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text("Please rate the movie!"),
        ),
      );
    } else {
      setState(() {
        movie.reviews
            .add(Review(globals.current, double.parse(review.text), text));

        for (Review r in movie.reviews) {
          print(r.comment);
        }
      });

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text("Post reviewed!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var movieRating = 0.0;
    for (var i = 0; i < movie.reviews.length; i++) {
      movieRating += movie.reviews[i].review;
    }
    movieRating /= movie.reviews.length;

    return Theme(
      data: globals.darkThemeEnabled ? globals.darkTheme : globals.lightTheme,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            PopupMenuButton(
              color: Colors.white,
              offset: Offset(10, 50),
              itemBuilder: (context) {
                return [
                  globals.darkThemeEnabled
                      ? 'Enable Light Theme'
                      : 'Enable Dark Theme'
                ].map(
                  (e) {
                    return PopupMenuItem(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            globals.darkThemeEnabled =
                                !globals.darkThemeEnabled;
                          });
                        },
                        child: Text(
                          e,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  },
                ).toList();
              },
            ),
          ],
        ),
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: TabBarView(
              children: [
                Background(
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.55),
                          Container(
                            color: globals.darkThemeEnabled
                                ? globals.darkTheme.scaffoldBackgroundColor
                                : globals.lightTheme.scaffoldBackgroundColor,
                            child: Column(
                              children: [
                                Shimmer(
                                  child: Container(
                                    width: size.width,
                                    padding: EdgeInsets.only(
                                        top: 30, bottom: 30, left: 20),
                                    child: Text('${movie.name}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                                Container(
                                  width: size.width,
                                  padding: EdgeInsets.only(
                                      top: 10, left: 40, bottom: 10),
                                  color: globals.darkThemeEnabled
                                      ? globals
                                          .darkTheme.scaffoldBackgroundColor
                                      : globals
                                          .lightTheme.scaffoldBackgroundColor,
                                  child: Text(
                                    'Description',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
                                  color: globals.darkThemeEnabled
                                      ? globals
                                          .darkTheme.scaffoldBackgroundColor
                                      : globals
                                          .lightTheme.scaffoldBackgroundColor,
                                  child: Text(
                                    '${movie.desc}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: globals.darkThemeEnabled
                                            ? Colors.grey[200]
                                            : Colors.grey[800]),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  width: size.width,
                                  padding: EdgeInsets.only(
                                      top: 20, left: 40, bottom: 20),
                                  color: globals.darkThemeEnabled
                                      ? globals
                                          .darkTheme.scaffoldBackgroundColor
                                      : globals
                                          .lightTheme.scaffoldBackgroundColor,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Rating',
                                            style:
                                                TextStyle(color: Colors.black)),
                                        TextSpan(
                                            text:
                                                '       ${movieRating.toStringAsFixed(1)}  ',
                                            style: TextStyle(
                                                color: globals.darkThemeEnabled
                                                    ? Colors.white
                                                    : Colors.black)),
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: size.width,
                                  padding: EdgeInsets.only(
                                      top: 20, left: 20, bottom: 20),
                                  color: globals.darkThemeEnabled
                                      ? globals
                                          .darkTheme.scaffoldBackgroundColor
                                      : globals
                                          .lightTheme.scaffoldBackgroundColor,
                                  child: Text(
                                    'Post your review!',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 25, bottom: 15, right: 25),
                                  color: globals.darkThemeEnabled
                                      ? globals
                                          .darkTheme.scaffoldBackgroundColor
                                      : globals
                                          .lightTheme.scaffoldBackgroundColor,
                                  child: Form(
                                    key: _formKey,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: _ratingController,
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText:
                                                  "How do you rate this movie? (0.0 - 5.0)",
                                              hintStyle: TextStyle(
                                                  color:
                                                      globals.darkThemeEnabled
                                                          ? Colors.grey[100]
                                                          : Colors.grey[800]),
                                            ),
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 15),
                                            color: Colors.grey[200],
                                            child: TextFormField(
                                              controller: _reviewController,
                                              maxLines: 5,
                                              decoration:
                                                  InputDecoration.collapsed(
                                                hintText:
                                                    "Enter your review here",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              validator: (text) {
                                                if (text == null ||
                                                    text.isEmpty) {
                                                  return "Review can't be empty!";
                                                }
                                                return null;
                                              },
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 10),
                                  child: SizedBox(
                                    height: size.height * 0.07,
                                    width: size.width * 0.25,
                                    child: ElevatedButton(
                                      onPressed: () => _onPressed(
                                          context,
                                          _reviewController.text,
                                          _ratingController.value),
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Color(globals.darkThemeEnabled
                                              ? 0xff415870
                                              : 0xfffaab60),
                                        ),
                                      ),
                                      child: Text(
                                        "Post".toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    movie),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Shimmer(
                        child: Container(
                          width: size.width,
                          padding: EdgeInsets.only(
                              top: size.height * 0.13, bottom: 30),
                          color: globals.darkThemeEnabled
                              ? globals.darkTheme.scaffoldBackgroundColor
                              : globals.lightTheme.scaffoldBackgroundColor,
                          child: Text(
                            '${movie.name}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Column(
                        children:
                            movie.reviews.map((e) => _buildWidget(e)).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.movie_filter_outlined)),
                Tab(icon: Icon(Icons.reviews_outlined)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
