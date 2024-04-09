import 'package:flutter/material.dart';
import 'package:flutter_api_calls/boxes/boxes.dart';
import 'package:flutter_api_calls/customWidgets/AlbumWidget.dart';
import 'package:flutter_api_calls/models/Album.dart';
import 'package:flutter_api_calls/service/apiService.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  List<Album> _albums = [];
  bool _isLocallyStore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Albums "),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_isLocallyStore) {
            print("IF ::::::  _isLocallyStore");
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Albums are already stored locally")));
          } else {
            print("ELSE ::::::  _isLocallyStore");
            var dataBox = Boxes.getAlbums();
            dataBox.addAll(_albums);
            _isLocallyStore = true;
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Albums are stored locally")));
          }
        },
        child: const Icon(
          Icons.hive_rounded,
          color: Colors.blueAccent,
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: ApiService().getAllAlbums(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _albums = snapshot.data!;

              return ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.all(8),
                        child: AlbumWidget(
                            id: snapshot.data![index].id,
                            userId: snapshot.data![index].userId,
                            title: snapshot.data![index].title));
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: snapshot.data!.length);
            }

            if (snapshot.hasError) {
              return Text("Unable to fetch data! Try again later");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
