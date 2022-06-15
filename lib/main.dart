import 'package:flutter/material.dart';
import 'package:resto_api/ui/list_resto_screen.dart';
import 'package:resto_api/ui/page_detail.dart';
import 'package:resto_api/ui/search_resto.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restoran App',
        theme: ThemeData(
        primarySwatch: Colors.blue
    ),
      home: ListRestoScreen(),


      routes: {
          DetailPageList.routeName: (context) => DetailPageList(
            id: ModalRoute.of(context)?.settings.arguments as String,
          ),
        SearchPageScreen.routeName: (context) => SearchPageScreen()
      },
    );
  }
}

