import 'package:flutter/material.dart';
import '../../Constance/imgaeasset.dart';
import '../../Constance/mycolor.dart';
import '../widgets/ItemCard.dart';


class Interface extends StatefulWidget {
  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  String selectedvalue = "Option 1";
  TextEditingController Investor =TextEditingController();
  TextEditingController Investement =TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            buildTopRow(),
            buildWelcomeContainer(),
            buildStartNowText(),
            buildDropDownList(),




            //  Padding(
            //                   padding:  EdgeInsets.symmetric(horizontal: 20.0),
            //                   child: DropdownButtonFormField<String>(
            //                     value: selectedvalue,
            //                     onChanged: (String? newValue) {
            //                       setState(() {
            //                         selectedvalue = newValue!;
            //                       });
            //                     },
            //
            //                     decoration: InputDecoration(
            //                       border: OutlineInputBorder(
            //                         borderRadius: BorderRadius.circular(10.0),
            //                       ),
            //                     ),
            //                     items: <String>['Option 1', 'Option 2', 'Option 3']
            //                         .map<DropdownMenuItem<String>>((String value) {
            //                       return DropdownMenuItem<String>(
            //                         value: value,
            //                         child: Text(value),
            //                       );
            //                     }).toList(),
            //                   ),
            //                 ),









          ],
        ),

      ),
      drawer: buildAppDrawer(),

    );
  }


  Widget buildTopRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: IconButton(
            icon: Icon(
              Icons.format_align_left_sharp,
              size: 25,
              color: MyColor.greydark,
            ),
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Image.asset(
            MyImages.logo,
            width: MediaQuery.of(context).size.width * 0.4,
          ),
        ),
      ],
    );
  }
  Widget buildWelcomeContainer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width * 0.98,
        decoration: BoxDecoration(
          color: MyColor.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Welcome To Our Service\n We Are Here\n For You ...",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Rubik",
                ),
              ),
            ),
            Image.asset(
              MyImages.Chart,
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
  Widget buildStartNowText() {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Text(
        "Start Now To Choose :",
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontFamily: "Rubik",
        ),
      ),
    );
  }
  Widget buildDropDownList() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 340,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return DropDownList();
        },
        itemCount: 2,
      ),
    );
  }
  Widget buildAppDrawer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 150),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Drawer(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: ListView(
            children: [
              buildDrawerItem(
                icon: Icons.paid_outlined,
                title: 'Buy',
              ),
              buildDrawerItem(
                icon: Icons.money,
                title: 'Sale',
              ),
              buildDrawerItem(
                icon: Icons.other_houses,
                title: 'OTP',
              ),
              buildDrawerItem(
                icon: Icons.logout,
                title: 'Log out',
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildDrawerItem({required IconData icon, required String title}) {
    return ListTile(
      trailing: IconButton(
        icon: Icon(Icons.arrow_forward_ios_sharp),
        onPressed: () {},
      ),
      leading: Icon(
        icon,
        color: MyColor.blue,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}