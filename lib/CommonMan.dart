import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:treehacks2023/api/firebase_api.dart';
import 'package:treehacks2023/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';


import 'package:treehacks2023/main.dart';
import 'package:treehacks2023/Users.dart';
import 'package:treehacks2023/search.dart';
import 'package:treehacks2023/donation.dart';



class CommonMan extends StatelessWidget {
  const CommonMan({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    

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
              ButtonWidget(
                text: 'Search',
                icon: Icons.search,
                onClicked:(){
   Navigator.push(context, MaterialPageRoute(builder: (context) {
     return Search();
   }));
                }

              ),
              SizedBox(height: 8),
              
              SizedBox(height: 48),
              ButtonWidget(
                text: 'Location',
                icon: Icons.location_on,
                onClicked:(){
   Navigator.push(context, MaterialPageRoute(builder: (context) {
     return const CommonMan(title: 'CommonMan');
   }));
                }

              ),
              SizedBox(height: 8),
              
              SizedBox(height: 48),

              ButtonWidget(
                text: 'Chat',
                icon: Icons.chat,
                onClicked:(){
   Navigator.push(context, MaterialPageRoute(builder: (context) {
     return const CommonMan(title: 'CommonMan');
   }));
                }

              ),
              SizedBox(height: 8),
              
              SizedBox(height: 48),
              ButtonWidget(
                text: 'Donation',
                icon: Icons.monetization_on,
                onClicked:(){
   Navigator.push(context, MaterialPageRoute(builder: (context) {
     return const CommonMan(title: 'CommonMan');
   }));
                }
              ),
              SizedBox(height: 20),
              
            ],
          ),
        ),
      ),
    );
  }
}



