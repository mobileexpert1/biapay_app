import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as sync;
import '../../../widgets/export_file.dart';
import '../controllers/dashboard_controller.dart';
class YearSlider extends StatefulWidget {
  @override
  _YearSliderState createState() => _YearSliderState();
}

class _YearSliderState extends State<YearSlider> {
  final List<String> names = <String>[
    'January 2021',
    'February 2021',
    'March 2021',
    'April 2021',
    'May 2021',
    'June 2021',
    'July 2021',
    'August 2021',
    'September 2021',
    'October 2021',
    'November 2021',
    'December 2021',
  ];

  int? tappedIndex;
  @override
  void initState() {
    super.initState();
    tappedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Material(
      child: Column(
        children: [
          Container(
            height: 30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        tappedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          color: tappedIndex == index
                              ? Colors.lightGreen[500]
                              : Colors.transparent,
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8))),
                      alignment: Alignment.center,
                      // height: 25,
                      width: 110,

                      child: Text(
                        '${names[index]}',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            width: Get.width,
            height: 800.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
            child: SfCircularChart(
              annotations: <CircularChartAnnotation>[
                CircularChartAnnotation(
                  widget: SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: const PhysicalModel(
                      // child: Container(),
                      shape: BoxShape.circle,
                      elevation: 10,
                      color: Color.fromRGBO(230, 230, 230, 1),
                    ),
                  ),
                ),
                CircularChartAnnotation(
                  widget: Container(
                    // elevation: 10,
                    // shadowColor: Colors.black,

                    child: Text(
                      'Total \n50,000 XAF',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                      ),
                    ),
                  ),
                )
              ],
              legend: Legend(
                orientation: LegendItemOrientation.vertical,
                alignment: ChartAlignment.center,
                isVisible: true,
                position: sync.LegendPosition.bottom,
                overflowMode: LegendItemOverflowMode.wrap,
                height: "${350.h}",
                width: "${400.h}",
              ),
              series: <CircularSeries>[
                // Renders doughnut chart

                DoughnutSeries<ChartData, String>(
                  dataSource: tappedIndex == 0
                      ? controller.financialPlaningChartData
                      : tappedIndex == 1
                      ? controller.fin
                      : controller.finn,
                  // dataSource: controller.financialPlaningChartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  dataLabelSettings: const DataLabelSettings(isVisible: false),
                  // pointRadiusMapper: (ChartData data, _) => data.size
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
