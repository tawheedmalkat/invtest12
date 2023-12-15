import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoportapp/Model/UserModel.dart';
import 'package:invoportapp/UI/screens/SpecificUser.dart';
import '../../Constance/imgaeasset.dart';
import '../../Controller/Auth/SignIn_Controller.dart';
import '../../Controller/Auth/post-data.dart';
import '../../main.dart';

class UserDataScreen extends StatefulWidget {
  final List<UserModel> userModels;

  const UserDataScreen({Key? key, required this.userModels}) : super(key: key);

  @override
  _UserDataScreenState createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  String selectedValue = 'Select an investment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null && newValue != 'Select an investment') {
                    UserModel selectedUserModel = widget.userModels
                        .firstWhere((userModel) => userModel.entityName == newValue);

                    Get.to(UserDetailsScreen(userModel: selectedUserModel));
                  }
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              items: ['Select an investment', ...widget.userModels.map<String?>((userModel) => userModel.entityName)]
                  .map<DropdownMenuItem<String>>(
                    (String? value) => DropdownMenuItem<String>(
                  value: value ?? 'Select an investment',
                  child: Text(value ?? 'Select an investment'),
                ),
              )
                  .toList(),
            ),
            SizedBox(height: 100,),
            //from new-test
            ElevatedButton.icon(

              onPressed: () async {

                String selectedId =selectedValue ;
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



          ],
        ),
      ),

    );
  }
}
