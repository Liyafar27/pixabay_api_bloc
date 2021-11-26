import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pixabay_api_bloc/model/image_pixabay_model.dart';

class ImageRepository {

  String apiKey = '24463472-c89a1e2a8e18efee63b2f6c40';
  String baseUrl = 'https://pixabay.com/api/';


  Future<List<ImagePixabay>> getImages() async {
    var url = baseUrl +
        '?key=$apiKey&per_page=100&editors_choice=true&orientation=vertical&image_type=photo';
    try {
      final response = await http.Client().get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> imageJson = data['hits'];
        final List<ImagePixabay> images =
            imageJson.map((i) => ImagePixabay.fromJson(i)).toList();
        return images;
      }
    } catch (e) {
      throw Exception();
    }
    throw UnimplementedError();
  }
  Future<List<ImagePixabay>> getImagesWithQuery(String query) async {
    var url = baseUrl +
        '?key=$apiKey&q=${query}&per_page=100&editors_choice=true&orientation=vertical&image_type=photo';
    try {
      final response = await http.Client().get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> imageJson = data['hits'];
        final List<ImagePixabay> images =
        imageJson.map((i) => ImagePixabay.fromJson(i)).toList();
        return images;
      }
    } catch (e) {
      throw Exception();
    }
    throw UnimplementedError();
  }
}
