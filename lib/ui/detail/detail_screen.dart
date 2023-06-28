import 'package:flutter/material.dart';
import 'package:photo_library/model/photo.dart';
import '../../api/json_placeholder_album_api_impl.dart';

// 앨범 목록
class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  Future<List<PhotoDTO>> futurePhotos = fetchPhotos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('디테일화면'),
      ),
      body: FutureBuilder<List<PhotoDTO>>(
        future: futurePhotos,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('에러'));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            List<PhotoDTO>? photos = snapshot.data;
            return GridView.count(
              crossAxisCount: 2,
              children: photos!.map((photo) {
                return Image.network(
                  photo.thumbnailUrl,
                  fit: BoxFit.cover,
                );
              }).toList(),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}