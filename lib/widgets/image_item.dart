import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixabay_api_bloc/model/image_pixabay_model.dart';
import 'package:shimmer/shimmer.dart';

import '../image_screen.dart';

class ImageItem extends StatelessWidget {
  final ImagePixabay image;

  ImageItem(this.image);

  @override
  Widget build(BuildContext context) {
    const imageNotFound = 'assets/ic_image_not_found.svg';
    const imageLoader = 'assets/ic_image_download.svg';

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => ImageScreen(image: image)));
      },
      child: CachedNetworkImage(
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey.shade100,
          highlightColor: Colors.grey.shade500,
          child: Center(
            child: SvgPicture.asset(
              imageLoader,
              fit: BoxFit.cover,
              height: 40.h,
              width: 40.w,
            ),
          ),
        ),
        height: 120.h,
        width: 120.w,
        imageUrl: image.webformatURL,
        fit: BoxFit.fitWidth,
        errorWidget: (context, url, error) {
          return Center(
            child: Container(
              height: 40.h,
              width: 40.w,
              child: SvgPicture.asset(
                imageNotFound,
                color: Colors.white70,
                height: 40.h,
                width: 40.w,
              ),
            ),
          );
        },
      ),
    );
  }
}
