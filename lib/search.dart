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
import 'package:treehacks2023/SearchResults.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}
Future _submitData(String text) async {
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
}
class _SearchState extends State<Search> {
  UploadTask? task;
  File? file;
  final TextEditingController _controller = TextEditingController();
  static final urlDownload = null;
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
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
                'Full Name:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(29, 194, 95, 1),
                  minimumSize: Size.fromHeight(50),
                ),
                child: const Text('Search for Name'),
                onPressed: () {
  _submitData(_controller.text);
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return const SearchResults();
  }));
}

              ),
              SizedBox(height: 70),
              ButtonWidget(
                text: 'Select File',
                icon: Icons.attach_file,
                onClicked: selectFile,
              ),
              SizedBox(height: 8),
              Text(
                fileName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30),
              ButtonWidget(
                text: 'Upload File',
                icon: Icons.cloud_upload_outlined,
                onClicked: uploadFile,
              ),
              SizedBox(height: 20),
              task != null ? buildUploadStatus(task!) : Container(),
            ],
          ),
        ),
      ),
    );
  }
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path!;
    setState(() => file = File(path));
  }
  Future uploadFile() async {
    if (file == null) return;
    final fileName = basename(file!.path);
    final destination = 'files/$fileName';
    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});
    if (task == null) return;
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload');
    await _submitImage(urlDownload);
  }
  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);
            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}