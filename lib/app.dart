import 'package:flutter/material.dart';
import 'package:uzaydan_misafirler/view/home_view.dart';
import 'package:uzaydan_misafirler/view/register_view.dart';
import 'package:uzaydan_misafirler/view/home_view.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var colorr = Colors.white;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,

      theme: ThemeData(
       colorSchemeSeed: colorr,
        brightness: Brightness.light,
        useMaterial3: true,
      ),

      darkTheme:  ThemeData(
        colorSchemeSeed:colorr,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),

      home: RegisterView(),
    );
  }
}