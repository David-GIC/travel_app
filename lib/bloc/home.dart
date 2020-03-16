import 'package:flutter/foundation.dart';

class HomeBloc extends ChangeNotifier {

  String _activeLocation = "Poulare";
  List<String> locationListTitle = ['Poulare', 'Japan', 'Moscow', 'London'];

  get activeLocation => _activeLocation;

  onLocationActive(String title){
    _activeLocation = title;
    notifyListeners();
  }

}