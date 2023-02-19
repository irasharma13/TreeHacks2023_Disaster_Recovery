import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:treehacks2023/api/firebase_api.dart';
import 'package:treehacks2023/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:treehacks2023/main.dart';
import 'package:treehacks2023/Users.dart';
import 'package:treehacks2023/CommonMan.dart';
import 'package:treehacks2023/search.dart';
import 'package:treehacks2023/User.dart';




Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class SearchResults extends StatefulWidget {
  const SearchResults({Key? key}) : super(key: key);
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  UploadTask? task;
  File? file;
  final TextEditingController _controller = TextEditingController();
  static final urlDownload = null;
  static final image_id = id;
  static final image_name = name;
  static final image = img;

  //static final response = search_family_response;

    //'{"name": "sai", "id": 30}';
  //Map<dynamic, dynamic> user = json.decode(response);


  @override
  Widget build(BuildContext context) {
    print('1');
    print('XXXXXXXXXXXXXXXXXXXX');
     print(image_id);
     print(image_name);
     print(image);
    final IconData icon;
    final String text;
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Found',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
               /*Text('ID: ${user['id']}'),
              Text('name: ${user['name']}'),*/
               Text('User: ${image_name}'),
               //Text('Image: ${image}'),
              
              SizedBox(height: 70),
              
              SizedBox(height: 8),
              
              SizedBox(height: 30),
              
              SizedBox(height: 20),
              
            ],
          ),
        ),
      ),
    );
  }
  
  
}

Future<String> getImageUrl(String imagePath) async {
  Reference ref = FirebaseStorage.instance.ref().child(imagePath);
  String downloadUrl = await ref.getDownloadURL();
  
  return downloadUrl;
}

