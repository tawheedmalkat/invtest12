import 'dart:convert';
import 'package:http/http.dart' as http ;
import 'package:flutter/material.dart';
//from new-test
Future<void> postData(String id, BuildContext context) async {
  var apiUrl = Uri.parse('https://dev.invoport.lu/api/interface2.php?account');
  var data = {
    'investor_id': id,
  };

  try {
    var response = await http.post(
      apiUrl,
      body: data,
    );

    var jsonResponse = json.decode(response.body);

    if (jsonResponse['message'] == "Valid investor Account!") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(jsonResponse['message']),
          duration: const Duration(seconds: 2),
        ),
      );
      print(jsonResponse);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(' ${response.body}'),
          duration: const Duration(seconds: 2),
        ),
      );
      print(" ${response.body}");
    }
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $error'),
        duration: const Duration(seconds: 2),
      ),
    );
    print("Error: $error");
  }
}
