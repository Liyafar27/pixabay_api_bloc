part of 'search_image_bloc.dart';

@immutable
abstract class SearchImageState {}

class ImageInitial extends SearchImageState {}

class ImageLoadingState extends  SearchImageState {}

class ImageLoadedState extends  SearchImageState {
  final List<ImagePixabay> images;
  ImageLoadedState({required this.images});
}


class NoConnectionExceptionState extends SearchImageState{
}
