import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/data.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ArticleListItem extends StatelessWidget {

  double _deviceWidth;

  Widget _articleList(BuildContext context) {

    _deviceWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                height: MediaQuery.of(context).size.height * 0.30,
                child: Container(
                  width: _deviceWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: NetworkImage(articles[index].image),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 2,
                            blurRadius: 20,
                            offset: Offset(0, 6)),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: _deviceWidth,
                        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: infoTopRow(articles[index].author),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: _deviceWidth * 0.05),
                        child: infoCenter(
                            title: articles[index].title,
                            location: articles[index].location,
                            context: context),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: _deviceWidth * 0.15,
                right: _deviceWidth * 0.15,
                child: infoBottom(context),
              )
            ],
          );
        },
      ),
    );
  }

  Widget infoTopRow(String author) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/alex.jpg'))),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$author",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "3 Hours ago",
                  style: TextStyle(color: Colors.white54),
                )
              ],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            SizedBox(
              height: 5,
            ),
            Icon(
              Icons.bookmark,
              color: Colors.white,
            )
          ],
        )
      ],
    );
  }

  Widget infoCenter({String title, String location, BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.play_arrow,
            color: Colors.red,
          ),
          onPressed: () => print("Floating action button pressed!!"),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.50,
              child: Text(
                "$title",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Text(
              '$location',
              style: TextStyle(color: Colors.white54),
            ),
            RatingBar(
              initialRating: 4.5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )
          ],
        )
      ],
    );
  }

  Widget infoBottom(BuildContext context){
    return Container(
      height: _deviceWidth * 0.15,
      width: _deviceWidth * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.favorite_border, color: Colors.red,),
              SizedBox(width: 5,),
              Text("120.3K", style: TextStyle(color: Colors.red),)
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.mode_comment, color: Colors.grey,),
              SizedBox(width: 5,),
              Text("2.5K", style: TextStyle(color: Colors.grey))
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.share, color: Colors.grey,),
              SizedBox(width: 5,),
              Text("150", style: TextStyle(color: Colors.grey))
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _articleList(context);
  }
}
