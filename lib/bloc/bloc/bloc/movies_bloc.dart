import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/data/response/response.dart';
import 'package:bloc_flutter/models/movies/movies_model.dart';
import 'package:bloc_flutter/repository/movies/movies_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesRepository moviesRepository;
  MoviesBloc({required this.moviesRepository})
      : super(MoviesState(moviesList: ApiResponse.loading())) {
    on<MoviesFetch>(fetchMoviesListApi);
  }

  Future<void> fetchMoviesListApi(
      MoviesFetch event, Emitter<MoviesState> emit) async {
    await moviesRepository.moviesapi().then((response) {
      emit(state.copyWith(
        moviesList: ApiResponse.completed(response),
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
        moviesList: ApiResponse.error(error.toString()),
      ));
    });
  }
}
