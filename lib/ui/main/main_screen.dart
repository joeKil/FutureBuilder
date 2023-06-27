import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_library/model/album.dart';
import '../../api/json_placeholder_album_api_impl.dart';

// 앨범 목록
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<AlbumDTO>>? futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = fetchAlbums();
  }

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
              future: futureAlbums,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  List<AlbumDTO>? albums = snapshot.data;
                  if (albums != null) {
                    return ListView(
                      children: albums.map((album) {
                        return ListTile(
                          title: Text(album.title),
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
          ElevatedButton(
              onPressed: () => GoRouter.of(context).go('/detail'),
              child: const Text('detail'))
        ],
      ),
    );
  }
}
