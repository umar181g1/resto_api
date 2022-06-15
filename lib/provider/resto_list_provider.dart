import 'package:flutter/material.dart';
import 'package:resto_api/data/api/api_service.dart';
import 'package:resto_api/data/model/ResRestoran.dart';

enum ResultState { loading, noData, hasData, error }

class RestoListProvider extends ChangeNotifier {
  final ApiService apiService;

  RestoListProvider({required this.apiService}) {
    _fetRestoList();
  }

  late ResultState _state;
  late ResRestoran _list;
  String _massage = '';

  ResultState get state => _state;

  ResRestoran get result => _list;

  String get message => _massage;

  Future<dynamic> _fetRestoList() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final resto = await apiService.getData();
      if (resto.restaurants.isNotEmpty) {
        _state = ResultState.hasData;
        notifyListeners();
        return _list = resto;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        return _massage = "Data Tidak Ada";
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _massage = 'Gagal Memuat Data';
    }
  }
}




