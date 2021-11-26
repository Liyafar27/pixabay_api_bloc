import 'package:flutter/material.dart';
import 'package:pixabay_api_bloc/bloc/search_image_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:pixabay_api_bloc/extensions/string.dart';

class RequestImage extends StatelessWidget {
  SearchImageBloc imageBloc;

  RequestImage(this.imageBloc);

  @override
  Widget build(BuildContext context) {
    var cityController = TextEditingController();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 30, left: 30, top: 80),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return hintText;
              }
              return null;
            },
            controller: cityController,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white70,
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: Colors.white70, style: BorderStyle.solid)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Colors.blue, style: BorderStyle.solid)),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white70),
            ),
            style: const TextStyle(color: Colors.white70),
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
        TextButton(
          onPressed: () {
            cityController.text.isNotEmpty
                ? imageBloc.add(SearchImages(cityController.text))
                : showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(requestEmpty,
                          style: Theme.of(context).textTheme.subtitle1),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(requestEmptyOk,
                              style: Theme.of(context).textTheme.subtitle1),
                        ),
                      ],
                    ),
                  );
          },
          child:
              Text(sendRequest, style: Theme.of(context).textTheme.headline1),
        ),
      ],
    );
  }
}
