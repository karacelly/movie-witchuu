library my_prj.globals;

import 'package:flutter/material.dart';
import 'package:movie_witchuu/models/movie.dart';
import 'package:movie_witchuu/models/review.dart';
import 'package:movie_witchuu/models/user.dart';
import 'package:movie_witchuu/pages/login/login.dart';

User current = User('kesya', 'Lalala123');

var darkThemeEnabled = true;

ThemeData darkTheme = new ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xff415870),
  scaffoldBackgroundColor: Color(0xff647c8b),
);
ThemeData lightTheme = new ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xfffaab60),
  scaffoldBackgroundColor: Color(0xffe7dfd7),
);

var movieList = [
  Movie(
      1,
      "Raya and the Lost Dragon",
      "Raya and the Last Dragon is an American animated film produced at Walt Disney Animation Studios and distributed by Walt Disney Studios Motion Pictures. The film follows Raya, a warrior princess who must find the fabled last dragon in order to save her divided home world from a ravenous plague.",
      [
        new Review(LoginPageState.userDB[0], 5.0, "emezinggg"),
        new Review(LoginPageState.userDB[1], 4.9, "keren sii ga boong"),
        new Review(LoginPageState.userDB[2], 5.0,
            "hmm blm nonton si tp review aja dulu")
      ],
      "raya.jpg"),
  Movie(
      2,
      "Ali & Ratu Ratu Queens",
      "Ali & Ratu Ratu Queens (transl. Ali & the Queens of Queens) is a 2021 Indonesian comedy-drama film directed by Lucky Kuswandi, written by Ginatri S. Noer and Muhammad Zaidy and starring Iqbaal Dhiafakhri Ramadhan, Marissa Anita, Aurora Ribero and Nirina Zubir. Ramadhan portrays the son from a divorced household visiting his mother (Anita) at New York City to reconcile.",
      [
        new Review(LoginPageState.userDB[1], 4.0, "biasa sii"),
        new Review(LoginPageState.userDB[0], 4.9, "keren sii ga boong"),
        new Review(LoginPageState.userDB[2], 5.0, "hehehe")
      ],
      "ali.jpg"),
  Movie(
      3,
      "Ready Or Not",
      "Ready or Not is a 2019 American black comedy horror film directed by Matt Bettinelli-Olpin and Tyler Gillett and written by Guy Busick and R. Christopher Murphy. The film stars Samara Weaving, Adam Brody, Mark O'Brien, Henry Czerny, and Andie MacDowell. Ready or Not follows Grace (Weaving), a newlywed who is hunted by her spouse's family as part of a wedding night ritual.",
      [
        new Review(LoginPageState.userDB[2], 5.0, "emezinggg"),
        new Review(LoginPageState.userDB[0], 4.9, "keren sii ga boong"),
        new Review(LoginPageState.userDB[1], 5.0,
            "hmm blm nonton si tp review aja dulu")
      ],
      "readyornot.jpg"),
  Movie(
      4,
      "Space Sweepers",
      "Space Sweepers  is a 2021 South Korean space Western film directed by Jo Sung-hee, starring Song Joong-ki, Kim Tae-ri, Jin Seon-kyu and Yoo Hae-jin. Regarded as the first Korean space blockbuster, it was released on Netflix on February 5, 2021.",
      [
        new Review(LoginPageState.userDB[2], 5.0, "song joongki my lup"),
        new Review(LoginPageState.userDB[0], 5.0, "keren sii ga boong"),
        new Review(LoginPageState.userDB[1], 5.0, "oppaaaa <3")
      ],
      "spacesweepers.jpg"),
  Movie(
      5,
      "Start Up",
      "Needing to make \$90k to open her own business, Seo Dal-Mi drops out of a university and takes up part-time work. She dreams of becoming someone like Steve Jobs. Nam Do-San is the founder of Samsan Tech. He is excellent with mathematics. He started Samsan Tech two years ago, but the company is not doing well. Somehow, Nam Do-San becomes Seo Dal-Mi’s first love. They cheer each others start and growth.",
      [
        new Review(
            LoginPageState.userDB[1], 5.0, "SECOND LEAD SYNDROME PARAH SI"),
        new Review(LoginPageState.userDB[0], 5.0, "bagus bgttt"),
        new Review(LoginPageState.userDB[2], 5.0, "jipyeong oppaaaa <3")
      ],
      "startup.jpg"),
  Movie(
      6,
      "To All The Boys: Always And Forever",
      "Senior year of high school takes center stage as Lara Jean returns from a family trip to Korea and considers her college plans — with and without Peter.",
      [
        new Review(LoginPageState.userDB[2], 5.0, "akhrinyaa hehehe"),
        new Review(LoginPageState.userDB[1], 4.0, "bagus yg kedua sih"),
        new Review(LoginPageState.userDB[0], 4.0, "so so lahh")
      ],
      "toalltheboys.png"),
];
