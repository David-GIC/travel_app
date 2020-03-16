import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/pages/widget/article_item.dart';
import 'package:travel_app/pages/widget/location_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
              child: Image.asset("assets/images/logo_discover.png")),
          leading: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black,
            onPressed: () => print("Menu pressed!!"),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: () => print("Search pressed!!"),
            )
          ],
          elevation: 0.1,
        ),
        body: Column(
          children: <Widget>[
            LocationBarWidget(),
            SizedBox(height: 10,),
            ArticleListItem()
          ],
        ),
    );
  }

}
