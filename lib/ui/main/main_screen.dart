import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_library/model/album.dart';
import '../../api/json_placeholder_album_api_impl.dart';

// 앨범 목록
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인화면'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<AlbumDTO>>(
              future: fetchAlbums(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  List<AlbumDTO>? albums = snapshot.data;
                  if (albums != null) {
                    return ListView(
                      children: albums.map((album) {
                        return ListTile(
                          title: Text(album.title),
                          onTap: () {
                            context.push('/detail');
                          },
                        );
                      }).toList(),
                    );
                  } else {
                    return const Center(child: Text('데이터없음'));
                  }
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
