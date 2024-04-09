import 'package:flutter/material.dart';
import 'package:flutter_api_calls/models/Album.dart';
import 'package:flutter_api_calls/screens/albumScreen.dart';
import 'package:flutter_api_calls/screens/commentsScreen.dart';
import 'package:flutter_api_calls/screens/localAlbumScreen.dart';
import 'package:flutter_api_calls/screens/photoScreen.dart';
import 'package:flutter_api_calls/screens/postsScreen.dart';
import 'package:flutter_api_calls/screens/todoScreen.dart';
import 'package:flutter_api_calls/screens/userScreen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(AlbumAdapter());

  await Hive.openBox<Album>('albums');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Api Calls Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const DrawerHeader(
                  child: Column(
                children: [
                  Text("Jainil Dalwadi"),
                  CircleAvatar(
                    foregroundImage: NetworkImage(
                        "https://playcontestofchampions.com/wp-content/uploads/2021/11/champion-iron-man-infinity-war-720x720.jpg"),
                    maxRadius: 45,
                  )
                ],
              )),
              ListTile(
                leading: const Icon(Icons.post_add),
                title: const Text("Posts"),
                subtitle: const Text("100 Posts"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PostsScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.comment),
                title: const Text("Comments"),
                subtitle: const Text("500 Comments"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CommentsScreen(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_album_outlined),
                title: const Text("Album"),
                subtitle: const Text("100 Albums"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AlbumScreen(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_size_select_actual_outlined),
                title: const Text("Photos"),
                subtitle: const Text("5000 Photos"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhotoScreen(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today_outlined),
                title: const Text("Todos"),
                subtitle: const Text("200 Todos"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TodoScreen(),
                      ));
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Users"),
                subtitle: Text("10 Users"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserScreen(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_album_outlined),
                title: const Text("Local Album"),
                subtitle: const Text("100 Albums"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LocalAlbumScreen(),
                      ));
                },
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text("API Calls"),
        ));
  }
}
