import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:pixabay_api_bloc/widgets/images_content.dart';
import 'package:pixabay_api_bloc/widgets/request_image.dart';

import 'bloc/search_image_bloc.dart';
import 'extensions/string.dart';
import 'model/image_pixabay_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = SearchImageBloc(ImageRepository())..add(SearchImagesInit());
    return ScreenUtilInit(
      designSize: Size(375, 800),
      allowFontScaling: false,
      builder: () => MaterialApp(
        title: titleApp,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.white70,
              fontSize: 24.sp,
            ),
            headline2: TextStyle(
              color: Colors.white70,
              fontSize: 18.sp,
            ),
          ),
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[900],
          body: BlocProvider<SearchImageBloc>(
            create: (context) => bloc,
            child: _GalaryImage(),
          ),
        ),
      ),
    );
  }
}

class _GalaryImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageBloc = (BlocProvider.of<SearchImageBloc>(context));

    return BlocBuilder<SearchImageBloc, SearchImageState>(
      builder: (context, state) {
        if (state is ImageLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ImageLoadedState) {
          return ImageContent(imageBloc, state.images);
        } else if (state is NoConnectionExceptionState) {
          return Column(
            children: [
              RequestImage(imageBloc),
              Center(
                  child: Text(
                noConnectionExceptionState,
                style: TextStyle(color: Colors.red),
              ))
            ],
          );
        }

        return Container();
      },
    );
  }
}
