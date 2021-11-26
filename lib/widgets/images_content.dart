import 'package:flutter/material.dart';
import 'package:pixabay_api_bloc/bloc/search_image_bloc.dart';
import 'package:pixabay_api_bloc/model/image_pixabay_model.dart';
import 'package:pixabay_api_bloc/widgets/request_image.dart';

import 'grid_image.dart';

class ImageContent extends StatelessWidget {
  final List<ImagePixabay> images;
  final SearchImageBloc imageBloc;

  ImageContent(this.imageBloc, this.images);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          RequestImage(imageBloc),
          GridImage(imageBloc, images),
        ],
      ),
    );
  }
}
