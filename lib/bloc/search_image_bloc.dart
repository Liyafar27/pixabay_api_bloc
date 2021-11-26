import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pixabay_api_bloc/model/image_pixabay_model.dart';
import 'package:pixabay_api_bloc/model/image_pixabay_repo.dart';

part 'search_image_event.dart';

part 'search_image_state.dart';

class SearchImageBloc extends Bloc<SearchImageEvent, SearchImageState> {
  final ImageRepository _imageRepository;

  SearchImageBloc(this._imageRepository) : super(ImageInitial());

  @override
  Stream<SearchImageState> mapEventToState(
    SearchImageEvent event,
  ) async* {
    if (event is SearchImagesInit) {
      yield ImageLoadingState();
      try {
        final response = await _imageRepository.getImages();
        yield ImageLoadedState(images: response);
      } catch (error) {
        yield NoConnectionExceptionState();
      }
    }
    if (event is SearchImages) {
      yield ImageLoadingState();
      try {
        final response = await _imageRepository.getImagesWithQuery(event.query);
        yield ImageLoadedState(images: response);
      } catch (error) {
        yield NoConnectionExceptionState();
      }
    }
  }
}
