import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/bloc/home.dart';
import 'package:travel_app/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<HomeBloc>.value(
        value: HomeBloc(),
        child: HomePage(),
      ),
    );
  }
}
