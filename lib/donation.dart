/*mport 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
import 'package:treehacks2023/CommonMan.dart';
import 'package:treehacks2023/search.dart';



class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  bool _isCheckboxSelected = false;

  Future<void> _submitDonation() async {
    if (_isCheckboxSelected) {
      // Send the user to the Checkbook API
      String url = uri.parse("https://checkbook.io/v3/check/digital");
      Map<String, String> headers = {"Content-type": "application/json"};
      String body = '{"recipient": "recipient@example.com", "amount": 10.0}';
      http.Response response = await http.post(url.parse, headers: headers, body: body);
      if (response.statusCode == 200) {
        // Donation successful
        // Navigate to success screen
        Navigator.pushNamed(context, "/donationSuccess");
      } else {
        // Donation failed
        // Show error message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Donation Failed"),
              content: Text("There was an error processing your donation. Please try again later."),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      // Checkbox not selected, show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Checkbox Not Selected"),
            content: Text("Please select the checkbox to proceed with the donation."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donation Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Would you like to donate \$10?"),
            Checkbox(
              value: _isCheckboxSelected,
              onChanged: (bool value) {
                setState(() {
                  _isCheckboxSelected = value;
                });
              },
            ),
            ElevatedButton(
              child: Text("Donate"),
              onPressed: () {
                _submitDonation();
              },
            ),
          ],
        ),
      ),
    );
  }
}*/
