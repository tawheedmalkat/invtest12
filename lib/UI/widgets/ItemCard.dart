import 'package:flutter/material.dart';

import '../../Constance/mycolor.dart';
//
class DropDownList extends StatefulWidget {


  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String selectedvalue = "Option 1";
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300.0,
        width: 300.0,
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: MyColor.whiteui,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),

        ),
        child: Padding(
          padding:  EdgeInsets.all(15),
          child: Stack(
              children:[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Text("Select Investor",style: TextStyle(color: Colors.green,fontSize: 15),),
                    SizedBox(height: 20,),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width*0.7,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColor.green,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          _showDropdownDialog(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(" Investor: $selectedvalue",style: TextStyle(color: Colors.white),),
                            Icon(Icons.sell_rounded,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 33,vertical: 16),
                        height: 50,
                        width: MediaQuery.of(context).size.width*0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue
                        ),
                        child: Text(
                          "Submit",style:  TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Rubik",),
                        ),
                      ),
                    ),

                  ],
                )]

          ),
        )
    );
  }


  void _showDropdownDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Investor"),
          content: Container(

            width: double.minPositive,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3, // عدد الخيارات
              itemBuilder: (BuildContext context, int index) {
                final option = 'Option ${index + 1}';
                return ListTile(
                  title: Text(option),
                  onTap: () {
                    setState(() {
                      selectedvalue = option;
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}