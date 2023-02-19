import 'package:json_annotation/json_annotation.dart';


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

@JsonSerializable()
class User {

  String name;
  String id;

  User({required this.name, required this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      
      name: json['name'],
      id: json['id'],
    );
  }
}
