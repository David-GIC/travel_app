import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/bloc/home.dart';

class LocationBarWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final HomeBloc _homeController = Provider.of<HomeBloc>(context);

    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 50,
      decoration: BoxDecoration(
          color: Color.fromRGBO(69, 69, 69, 1),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: _homeController.locationListTitle.map((title) {
          bool isActive = _homeController.activeLocation == title ? true : false;
          return InkWell(
            onTap: () => _homeController.onLocationActive(title),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 17),
                ),
                SizedBox(
                  height: 3,
                ),
                isActive
                    ? Container(
                  width: 50,
                  height: 3,
                  color: Colors.redAccent,
                )
                    : Container(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
