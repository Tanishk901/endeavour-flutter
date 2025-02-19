import 'package:endeavour/constant/style.dart';
import 'package:endeavour/model/hive_movie_model.dart';
import 'package:endeavour/model/hive_tv_model.dart';
import 'package:endeavour/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';  

void main() async {
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  Hive.registerAdapter(HiveTVModelAdapter());
  Hive.registerAdapter(HiveMovieModelAdapter());
  await Hive.openBox<HiveMovieModel>('movie_lists');
  await Hive.openBox<HiveTVModel>('tv_lists');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        //color applied to all pages
        scaffoldBackgroundColor: Style.primaryColor,
        appBarTheme: const AppBarTheme(backgroundColor: Style.primaryColor),
      ),
      home: const SplashScreen(),
    );
  }
}
