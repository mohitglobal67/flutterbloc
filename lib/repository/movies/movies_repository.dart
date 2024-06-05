import 'package:bloc_flutter/config/app_url.dart';
import 'package:bloc_flutter/data/network/network_api_services.dart';
import 'package:bloc_flutter/models/movies/movies_model.dart';

class MoviesRepository {
  final _api = NetworkServisesApi();

  Future<MoviesModel> moviesapi() async {
    final response = await _api.getApi(
      AppUrl.popularMoviesListEndPoint,
    );
    return MoviesModel.fromJson(response);
  }
}
