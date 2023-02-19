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
/*Future _submitData(String text) async {
  final url =
      Uri.parse('https://63f143675703e063fa5517ad.mockapi.io/search-family');
  try {
    final response = await http.post(
      url,
      body: {'name': text},
    );
    // Handle success response
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  } catch (error) {
    // Handle error response
    print('Error: $error');
  }
}
Future _submitImage(String imgUrl) async {
  final url =
      Uri.parse('https://63f143675703e063fa5517ad.mockapi.io/uploaded-image');
  try {
    final response = await http.post(
      url,
      body: {'image': imgUrl},
    );
    // Handle success response
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  } catch (error) {
    // Handle error response
    print('Error: $error');
  }
}*/
class _SearchResultsState extends State<SearchResults> {
  UploadTask? task;
  File? file;
  final TextEditingController _controller = TextEditingController();
  static final urlDownload = null;
  @override
  Widget build(BuildContext context) {

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