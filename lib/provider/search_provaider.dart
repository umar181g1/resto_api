
import 'package:flutter/widgets.dart';
import 'package:resto_api/data/api/api_service.dart';
import 'package:resto_api/data/model/ResSearch.dart';

enum ResultState { loading, noData, hasData, error }
class SearchResProvider extends ChangeNotifier{
  final ApiService apiService;

  SearchResProvider({required this.apiService}){
    fetcViewRes(query);
  }
  ResultState? _state;
  ResSearch? _search;
  String _query = '';
  String _message = '';

  ResultState? get state => _state;
  ResSearch? get result => _search;
  String get query => _query;
  String get message => _message;

  Future<dynamic> fetcViewRes(String query) async{
    try{
      if(query.isNotEmpty){
        _state = ResultState.loading;
        _query = query;
        notifyListeners();
        final resResult = await apiService.restoSearch(query);
        if(resResult.restaurants.isNotEmpty){
          _state = ResultState.hasData;
          notifyListeners();
          return _search = resResult;
        }else{
          _state = ResultState.noData;
          notifyListeners();
          return _message = 'Resto Tidak Ditemukan';
        }
      }
    }catch(e){
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Gagal Memuat Data';
    }
  }
}