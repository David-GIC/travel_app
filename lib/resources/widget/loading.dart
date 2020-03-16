import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitFoldingCube(
      size: 40,
      color: Colors.red,
    );
  }
}
