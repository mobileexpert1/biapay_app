import 'package:biapay_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';

class CustomChart extends StatefulWidget {
  final List<ChartData> chartData;
  const CustomChart({Key? key, required this.chartData}) : super(key: key);

  @override
  _CustomChartState createState() => _CustomChartState();
}

class _CustomChartState extends State<CustomChart> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(),
          // child: AspectRatio(
          //   aspectRatio: 1,
          //   child: PieChart(
          //     PieChartData(
          //         pieTouchData: PieTouchData(touchCallback: (touchEvent,pieTouchResponse) {
          //           setState(() {
          //             if (touchEvent is FlLongPressEnd ||
          //                 touchEvent is FlPanEndEvent) {
          //               touchedIndex = -1;
          //             } else {
          //               touchedIndex = pieTouchResponse!.touchedSection!.touchedSectionIndex;
          //             }
          //           });
          //         }),
          //         borderData: FlBorderData(
          //           show: false,
          //         ),
          //         sectionsSpace: 0,
          //         centerSpaceRadius: 40,
          //         sections: List<PieChartSectionData>.from(widget.chartData
          //             .asMap()
          //             .map((index, value) => MapEntry(
          //                 index,
          //                 PieChartSectionData(
          //                     color: Color(value.color),
          //                     value: value.value,
          //                     title: '${value.x}%',
          //                     radius: index == touchedIndex ? 60 : 50,
          //                     titleStyle: TextStyle(
          //                         fontSize: index == touchedIndex ? 25 : 16,
          //                         fontWeight: FontWeight.bold,
          //                         color: const Color(0xffffffff)))))
          //             .values)),
          //   ),
          // ),
        ),
        // SizedBox(
        //   width: 180.w,
        //   child: ListView.builder(
        //       shrinkWrap: true,
        //       physics: const NeverScrollableScrollPhysics(),
        //       itemCount: widget.chartData.length,
        //       itemBuilder: (context, index) => Indicator(
        //             color: Color(widget.chartData[index].color),
        //             text: widget.chartData[index].title,
        //             isSquare: true,
        //           )),
        // ),
      ],
    );
  }
}
