part of 'search_image_bloc.dart';

@immutable
abstract class SearchImageEvent {}
class SearchImagesInit extends SearchImageEvent {}


class SearchImages extends SearchImageEvent {
  final String query;
  SearchImages(this.query);}



