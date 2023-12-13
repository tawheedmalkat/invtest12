import 'package:flutter/material.dart';
import 'package:invoportapp/Model/UserModel.dart';

import '../../Controller/Auth/SignIn_Controller.dart';

class UserDataScreen extends StatefulWidget {

  final SignInControllerImp signInController;


  UserDataScreen( this.signInController,);

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  String selectedValue = 'Your Account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          onPressed: () {
            widget.signInController.signIn(context) {
              setState(() {
                selectedValue = newValue;
              });
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff03A8EA),
            minimumSize: const Size(double.infinity, 56),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
          ),
          icon: Image.asset("images/img_2.png"),
          label: Text("Log In", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
void showCustomDialog(BuildContext context, {required ValueChanged<String> onValue}) {
  String selectedValue = 'Your Account';
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.57,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(0, 30),
                  blurRadius: 60,
                ),
                const BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 30),
                  blurRadius: 60,
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Choose : $selectedValue',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        onValue('Your Account');
                        Navigator.of(context).pop(); // Close the dialog
                        // Navigate to the desired page
                        Navigator.of(context).pushNamed('/home');
                      },
                      child: Text('Your Account'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        onValue('Your Account 2');

                      },
                      child: Text('Your Account 2'),
                    ),
                    // Add similar buttons for other items in the list
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: anim, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
  );
}

//Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Entity Name: ${userModel.entityId}'),
//             Text('Entity Name: ${userModel.entityName}'),
//
//           ],
//         ),