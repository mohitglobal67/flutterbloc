import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_model.freezed.dart'; // Importing generated code for Freezed class
part 'movies_model.g.dart';

@freezed
class MoviesModel with _$MoviesModel {
  factory MoviesModel({
    @Default('') String token,
    @Default(0) int page,
    @Default(0) int pages,
    @Default([]) @JsonKey(name: 'tv_shows') List<TvShows> tvShow,
  }) = _MoviesModel;

  /// Factory constructor for creating a [UserModel] instance from JSON.
  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json); // JSON deserialization method
}

@freezed
class TvShows with _$TvShows {
  /// Factory constructor for creating a [TvShows] instance.
  factory TvShows({
    @JsonKey(name: 'name') @Default('') String name, // Name of the TV show
    @Default('') String permalink, // Permalink of the TV show
    @Default('') String endDate, // End date of the TV show
    @Default('') String network, // Network of the TV show
    @Default('')
    String imageThumbnailPath, // Image thumbnail path of the TV show
    @Default('') String status, // Status of the TV show
  }) = _TvShows; // Constructor for the freezed class

  /// Factory constructor for creating a [TvShows] instance from JSON.
  factory TvShows.fromJson(Map<String, dynamic> json) =>
      _$TvShowsFromJson(json); // JSON deserialization method
}
