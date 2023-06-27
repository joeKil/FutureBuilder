import 'package:http/http.dart' as http;
import 'package:photo_library/model/album.dart';
import 'dart:convert';

import 'package:photo_library/model/photo.dart';

Future<List<PhotoDTO>> fetchPhotos() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  List jsonResponse = json.decode(response.body);
  return jsonResponse.map((item) => PhotoDTO.fromJson(item)).toList();
}

Future<List<AlbumDTO>> fetchAlbums() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  List jsonResponse = json.decode(response.body);
  return jsonResponse.map((item) => AlbumDTO.fromJson(item)).toList();
}

