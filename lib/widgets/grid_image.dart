import 'package:flutter/material.dart';
import 'package:pixabay_api_bloc/bloc/search_image_bloc.dart';
import 'package:pixabay_api_bloc/extensions/string.dart';
import 'package:pixabay_api_bloc/model/image_pixabay_model.dart';
import 'image_item.dart';
import 'package:flutter_screenutil/size_extension.dart';

class GridImage extends StatelessWidget {
  final List<ImagePixabay> images;
  final SearchImageBloc imageBloc;

  GridImage(this.imageBloc, this.images);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Expanded(
          child: GridView.builder(
            itemCount: images.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return index != images.length
                  ? ImageItem(images[index])
                  : Container(
                      height: 100.h,
                      width: 100.w,
                      child: Center(
                        child: Text(itemsEnded,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline2),
                      ));
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
          ),
        ),
      ]),
    );
  }
}
