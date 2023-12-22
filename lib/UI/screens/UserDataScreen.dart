import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoportapp/Model/UserModel.dart';
import 'package:invoportapp/UI/screens/SpecificUser.dart';
import 'package:invoportapp/main.dart';
import '../../Controller/Auth/post-data.dart';

class UserDataScreen extends StatefulWidget {
  final List<UserModel> userModels;

  const UserDataScreen({Key? key, required this.userModels}) : super(key: key);

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  final Duration animDuration = const Duration(milliseconds: 250);
  int touchedIndex = -1;
  bool isPlaying = false;

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
                    UserModel selectedUserModel = widget.userModels.firstWhere(
                            (userModel) => userModel.entityName == newValue,
                        orElse: () => UserModel(
                            entityId: 0,
                            entityName: '')); // Replace with default values
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
                  ...widget.userModels
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              // CustomLoginButton(
              //   label: 'Submit',
              //   onPressed: () async {
              //     print('${sharedPref?.getString('token')}');
              //     String selectedId = '0';
              //     await controller.postData(selectedId,'${sharedPref?.getString('token')}',context);
              //   },
              //   isLoading: controller.isLoading(),
              // ),

              Container(
                padding: EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(25)),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: BarChart(
                                    mainBarData(),
                                    swapAnimationDuration: animDuration,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueGrey,
          //tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String entityName;

            for (int i = 0; i < widget.userModels.length; i++) {
              if (groupIndex == i) {
                entityName = '${widget.userModels[i].entityName}';
                return BarTooltipItem(
                  '$entityName\n',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${widget.userModels[i].entityId}',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
                break;
              }
            }
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color? barColor,
        double width = 22,
        List<int> showTooltips = const [],
      }) {
    barColor ??= Colors.blueAccent;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? Colors.yellow : Colors.white,
          width: width,
          borderSide: isTouched
              ? BorderSide(
            color: Colors.blueAccent,
          )
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Colors.lightBlueAccent,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(8, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 5, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 5, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 9, isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
      case 7:
        return makeGroupData(7, 6.5, isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    for (int i = 0; i < widget.userModels.length; i++) {
      if (value == i) {
        text = Container(
          width: 30,
          height: 300,
          child: Text(
            '${widget.userModels[i].entityName}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 7,
            ),
          ),
        );
        return SideTitleWidget(
          axisSide: meta.axisSide,
          space: 16,
          child: text,
        );
        break;
      }
    }
    switch (value.toInt()) {
      case 0:
        text = Text('${widget.userModels.first.entityName}', style: style);
        break;
      case 1:
        text = const Text('T', style: style);
        break;
      case 2:
        text = const Text('W', style: style);
        break;
      case 3:
        text = const Text('T', style: style);
        break;
      case 4:
        text = const Text('F', style: style);
        break;
      case 5:
        text = const Text('S', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}
