import 'package:contact_book/core/enums/network_state.dart';
import 'package:flutter/widgets.dart';

class BaseViewModel extends ChangeNotifier {
  NetworkState _state = NetworkState.COMPLETE;

  NetworkState get state => _state;
  bool get isLoading => _state == NetworkState.BUSY;

  String? errorMessage;

  void setState(NetworkState viewState) {
    _state = viewState;
    notifyListeners();
  }
  
}