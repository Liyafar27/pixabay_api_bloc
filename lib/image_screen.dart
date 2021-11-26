import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixabay_api_bloc/model/image_pixabay_model.dart';
import 'package:share/share.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/size_extension.dart';

class ImageScreen extends StatefulWidget {
  final ImagePixabay image;

  ImageScreen({required this.image});

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    const imageLoader = 'assets/ic_image_download.svg';
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
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
              imageUrl: widget.image.largeImageURL,
              fit: BoxFit.cover,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {
              Share.share(widget.image.pageURL);
            },
          ),
        ],
      ),
    );
  }
}
