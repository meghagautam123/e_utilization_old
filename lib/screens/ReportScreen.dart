import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ReportScreen extends StatefulWidget{

  @override
  State<ReportScreen> createState() => _ReportScreenState();

}

class _ReportScreenState extends State<ReportScreen>
{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(
                "Reports",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'RobotoBold',
                    fontWeight: FontWeight.bold),
              )),
          backgroundColor: Colors.red.withOpacity(0.8)),



   body: PieChart(
   //data types you want to show

   dataMap: const {
    "View Submitted UC": 700,
    "View Pending UC": 1000,
    //"Medium": 250,
  },

  animationDuration: const Duration(milliseconds: 800),
  chartLegendSpacing: 32,
//height
  chartRadius: MediaQuery.of(context).size.height * 0.25,

  initialAngleInDegree: 0,
// Types of chart
  chartType: ChartType.ring,

  //centerText: "Followers",
  ringStrokeWidth: 32,
//ways to show values
  chartValuesOptions: const ChartValuesOptions(
    showChartValueBackground: true,
    showChartValues: true,
    showChartValuesInPercentage: false,
    showChartValuesOutside: false,
    decimalPlaces: 2,
  ),

//legend options
  legendOptions: const LegendOptions(

// true for horizontal legend and false for vertical legend
    showLegendsInRow: true,

//legend postion
    legendPosition: LegendPosition.bottom,


    showLegends: true,
    legendShape: BoxShape.circle, // BoxShape.rectangle
    legendTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
),

      /*  PieChart(
//data types you want to show
          dataMap: const {
            "LinkedIn": 700,
            "GitHub": 1000,
            "Medium": 250,
          },

          animationDuration: const Duration(milliseconds: 800),
          chartLegendSpacing: 32,
//height
          chartRadius: MediaQuery.of(context).size.height * 0.25,

          initialAngleInDegree: 0,
// Types of chart
          chartType: ChartType.ring,

          centerText: "Followers",
          ringStrokeWidth: 32,
// ways to show values
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: false,
            showChartValuesOutside: false,
            decimalPlaces: 2,
          ),

//legend options
          legendOptions: const LegendOptions(

// true for horizontal legend and false for vertical legend
            showLegendsInRow: true,

//legend postion
            legendPosition: LegendPosition.bottom,


            showLegends: true,
            legendShape: BoxShape.circle, // BoxShape.rectangle
            legendTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );*/



    );
  }





}