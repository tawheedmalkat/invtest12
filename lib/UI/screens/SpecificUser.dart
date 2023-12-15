import 'package:flutter/material.dart';

import '../../Constance/imgaeasset.dart';
import '../../Controller/Auth/post-data.dart';
import '../../Model/UserModel.dart';
import '../../main.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserModel userModel;

  const UserDetailsScreen({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${userModel.entityName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FractionallySizedBox(
              widthFactor: 0.99,
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Entity ID:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${userModel.entityId}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            FractionallySizedBox(
              widthFactor: 0.99,
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Entity Name:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${userModel.entityName}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            //from new test
            ElevatedButton.icon(
              onPressed: () async {

                String selectedId = '${userModel.entityId}';
                sharedPref?.setString('id', selectedId);
                await postData(selectedId,context);
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff03A8EA),
                minimumSize: Size(
                    double.infinity, MediaQuery.of(context).size.height * 0.07),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
              ),
              icon: Image.asset(
                MyImages.img_2,
                width: 20,
                height: 20,
              ),
              label: Text("Submit", style: TextStyle(color: Colors.white)),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
