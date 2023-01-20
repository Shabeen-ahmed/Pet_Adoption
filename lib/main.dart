
import 'package:flutter/material.dart';
import 'package:nymble_labs_pet_adoption/Provider/pet_provider.dart';
import 'package:nymble_labs_pet_adoption/Screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'Provider/category_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PetProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColorDark: Colors.amber
      ),
      darkTheme: ThemeData.dark(),
      home: SplashScreen(),
    );


  }
}


