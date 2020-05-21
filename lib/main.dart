import 'package:flutter/material.dart';
import 'package:food/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'data/data.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FoodData()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey.shade50,
        primaryColor: Colors.deepOrangeAccent,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreens(),
      },
    );
  }
}
