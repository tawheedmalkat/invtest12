import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoportapp/Model/UserModel.dart';
import 'package:invoportapp/UI/screens/SpecificUser.dart';
import '../../Controller/Auth/post-data.dart';
import '../widgets/CustomLoginButton.dart';

class UserDataScreen extends StatelessWidget {
  final List<UserModel> userModels;

  const UserDataScreen({Key? key, required this.userModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PostDataControllerImp());
    return GetBuilder<PostDataControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('User Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: controller.selectedValue,
                onChanged: (String? newValue) {
                  if (newValue != null && newValue != 'Select an investment') {
                    UserModel selectedUserModel = userModels.firstWhere(
                        (userModel) => userModel.entityName == newValue);
                    Get.to(UserDetailsScreen(userModel: selectedUserModel));
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                items: [
                  'Select an investment',
                  ...userModels
                      .map<String?>((userModel) => userModel.entityName)
                ]
                    .map<DropdownMenuItem<String>>(
                      (String? value) => DropdownMenuItem<String>(
                        value: value ?? 'Select an investment',
                        child: Text(value ?? 'Select an investment'),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.60),
              CustomLoginButton(
                label: 'Submit',
                onPressed: () async {
                  String selectedId = '0';
                  await controller.postData(selectedId, context);
                },
                isLoading: controller.isLoading(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//fgh