import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_api/provider/resto_detail_provider.dart';
import 'package:resto_api/wiget/detail_page.dart';
import '../data/api/api_service.dart';

class DetailPageList extends StatelessWidget {
  static const routeName = '/resto-detail';
  final String id;

  const DetailPageList({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ResDetailProvider(apiService: ApiService(), id: id),
      child: Consumer<ResDetailProvider>(
        builder: (context, state, _) {
          switch (state.state) {
            case ResultState.loading:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.brown,
                  backgroundColor: Colors.grey,
                ),
              );
            case ResultState.hasData:
              return PageDetail(restaurant: state.result.restaurant);
            case ResultState.error:
              return Center(
                child: Text(state.message),
              );
            default:
              return const Center(
                child: Text(
                  'Gagal memuat',
                  style: TextStyle(fontSize: 24),
                ),
              );
          }
        },
      ),
    );
  }
}


