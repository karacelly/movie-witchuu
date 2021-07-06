import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_witchuu/models/movie.dart';
import 'package:movie_witchuu/models/user.dart';
import 'package:movie_witchuu/pages/itempage/moviepage.dart';
import 'package:movie_witchuu/pages/login/login.dart';
import 'package:movie_witchuu/utils/global.dart' as globals;
import 'package:shimmer_animation/shimmer_animation.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  User curr = globals.current;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Image> listImage = [
      for (Movie movie in globals.movieList)
        Image(
          image: AssetImage(
            "assets/movies/" + movie.poster,
          ),
        ),
    ];

    return Theme(
      data: globals.darkThemeEnabled ? globals.darkTheme : globals.lightTheme,
      child: Scaffold(
        appBar: AppBar(
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
        drawer: Drawer(
          child: Container(
            child: ListView(
              children: [
                Shimmer(
                  child: new Container(
                    height: size.height * 0.2,
                    padding: EdgeInsets.only(left: 20),
                    child: new DrawerHeader(
                      child: Row(
                        children: [
                          new CircleAvatar(
                            radius: 25,
                            child: new Icon(Icons.image),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 22),
                            child: Text(
                              globals.current.username,
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                    color: globals.darkThemeEnabled
                        ? globals.darkTheme.primaryColor
                        : globals.lightTheme.primaryColor,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30),
                  leading: new Icon(Icons.home),
                  title: TextButton(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 18,
                            color: globals.darkThemeEnabled
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                    onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) {
                        return HomePage();
                      }))
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30),
                  leading: new Icon(Icons.movie),
                  title: TextButton(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Movies',
                        style: TextStyle(
                            fontSize: 18,
                            color: globals.darkThemeEnabled
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                    onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) {
                        return MoviePage();
                      }))
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30),
                  leading: new Icon(Icons.logout),
                  title: TextButton(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 18,
                            color: globals.darkThemeEnabled
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/logout');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Shimmer(
                  direction: ShimmerDirection.fromLeftToRight(),
                  child: Container(
                    padding: EdgeInsets.only(left: 35, right: 20),
                    color: globals.darkThemeEnabled
                        ? Colors.black
                        : Colors.grey[100],
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.04),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hello " + curr.username + "!",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: globals.darkThemeEnabled
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(height: size.height * 0.005),
                                  Text("Can't wait to have a movie witchuu~",
                                      style: TextStyle(
                                        color: globals.darkThemeEnabled
                                            ? Colors.grey
                                            : Colors.grey[850],
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.04),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.35,
                        padding: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/movies/banner.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30, left: 40, bottom: 25),
                        child: Row(
                          children: [
                            Text(
                              "Featured",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              " Movie",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: CarouselSlider(
                          items: listImage,
                          options: CarouselOptions(
                            height: 400,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                            autoPlayInterval: Duration(seconds: 5),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.07),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 40),
                              child: Row(
                                children: [
                                  Text(
                                    "The Butter",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    " to Your Popcorn",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.05),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  height: size.height * 0.20,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/movies/avengers.jpg"),
                                    ),
                                  ),
                                  child: Text(
                                    "aaaaaaaaaaaaaaaaa",
                                    style: TextStyle(color: Colors.transparent),
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.20,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/movies/farfromhome.jpg"),
                                    ),
                                  ),
                                  child: Text(
                                    "aaaaaaaaaaaaaaaaa",
                                    style: TextStyle(color: Colors.transparent),
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.20,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/movies/aladdin.jpg"),
                                    ),
                                  ),
                                  child: Text(
                                    "aaaaaaaaaaaaaaaaa",
                                    style: TextStyle(color: Colors.transparent),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.03),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15, bottom: 20),
                        width: size.width,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(20),
                              height: size.height * 0.3,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/movies/home1.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: null,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "The best way to watch a movie is snuggled up with"),
                                  Text(
                                    " you.",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
