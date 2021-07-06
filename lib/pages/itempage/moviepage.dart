import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_witchuu/models/movie.dart';
import 'package:movie_witchuu/pages/detailpage/detailpage.dart';
import 'package:movie_witchuu/pages/homepage/homepage.dart';
import 'package:movie_witchuu/utils/global.dart' as globals;
import 'package:shimmer_animation/shimmer_animation.dart';

class MoviePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MoviePageState();
  }
}

class MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width * 0.6;

    void _onPressed(Movie movie) {
      Navigator.push(context, MaterialPageRoute(builder: (builder) {
        return DetailPage(movie);
      }));
    }

    Widget _buildWidget(Movie movie) {
      return Container(
        child: GridTile(
          child: Shimmer(
            direction: ShimmerDirection.fromLTRB(),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.23,
                    width: size.width * 0.3,
                    child: Image.asset(
                      'assets/movies/${movie.poster}',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      '${movie.name}',
                      style: TextStyle(
                        color: globals.darkThemeEnabled
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    child: Text(
                      'Details',
                    ),
                    onPressed: () => _onPressed(movie),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

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
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/homepage');
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
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/movies');
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
        body: Container(
          padding: EdgeInsets.only(top: 1),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.35,
                  padding: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/movies/enolaholmes.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                GridView.count(
                  childAspectRatio: (itemWidth / itemHeight),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children:
                      globals.movieList.map((e) => _buildWidget(e)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
