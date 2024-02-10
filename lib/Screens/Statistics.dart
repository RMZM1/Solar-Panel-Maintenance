import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Style.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  bool showDailyChart = true;
  bool showWeeklyChart = false;
  bool showMonthlyChart = false;
  bool showYearlyChart = false;

  bool showSolarLine = true;
  bool showWindPowerLine = true;
  bool showProviderLine = true;

  // Data for the spline chart
  List<ChartDailyData> chartDailyData = [
    ChartDailyData("Mon", 20, 30, 40),
    ChartDailyData("Tue", 30, 40, 50),
    ChartDailyData("Wed", 20, 20, 40),
    ChartDailyData("Thu", 40, 30, 50),
    ChartDailyData("Fri", 30, 20, 90),
    ChartDailyData("Sat", 20, 40, 70),
    ChartDailyData("Sun", 40, 30, 80),
  ];
  List<ChartWeeklyData> chartWeeklyData = [
    ChartWeeklyData("Week 1", 350, 420, 490),
    ChartWeeklyData("Week 2", 360, 430, 500),
    ChartWeeklyData("Week 3", 370, 440, 600),
    ChartWeeklyData("Week 4", 380, 450, 700),
  ];
  List<ChartMonthlyData> chartMonthlyData = [
    ChartMonthlyData("Jan", 1500, 1600, 1700),
    ChartMonthlyData("Feb", 1800, 2000, 2500),
    ChartMonthlyData("Mar", 1600, 1800, 2000),
    ChartMonthlyData("Apr", 1400, 1200, 1500),
    ChartMonthlyData("May", 1500, 1500, 1600),
    ChartMonthlyData("Jun", 1500, 1800, 1500),
    ChartMonthlyData("Jul", 1600, 2000, 2000),
    ChartMonthlyData("Aug", 2000, 2400, 2400),
    ChartMonthlyData("Sep", 1800, 2000, 2100),
    ChartMonthlyData("Oct", 1700, 1800, 1900),
    ChartMonthlyData("Nov", 1300, 1400, 1700),
    ChartMonthlyData("Dec", 1400, 1200, 1500),
  ];
  List<ChartYearlyData> chartYearlyData = [
    ChartYearlyData(2018, 16000, 17000, 18000),
    ChartYearlyData(2019, 17000, 18000, 17000),
    ChartYearlyData(2020, 16000, 16000, 15000),
    ChartYearlyData(2021, 15000, 14000, 19000),
    ChartYearlyData(2022, 18000, 19000, 20000),
    ChartYearlyData(2023, 14000, 15000, 14000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Statistics",
            style: appBarTitle(),
          ),
        ),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () => {},
            child: const Text(""),
          ),
        ],
      ),
      body: Stack(children: [
        //Background Image TODO
        Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //WH Generated
            Text(
              "Wh Generated",
              style: greyTextColor(),
            ),
            Text(
              "19562",
              style: whTextStatistics(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.red,
                ),
                Text(
                  "21131 (14%)",
                  style: redTextColor(),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            //Buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //  Day
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: showDailyChart ? bottomBorder() : null,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showDailyChart = true;
                          showWeeklyChart = false;
                          showMonthlyChart = false;
                          showYearlyChart = false;
                        });
                      },
                      child: Text(
                        "Day",
                        style: showDailyChart
                            ? themeTextBtnColor()
                            : greyTextBtnColor(),
                      ),
                    ),
                  ),
                  //  Week
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: showWeeklyChart ? bottomBorder() : null,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showDailyChart = false;
                          showWeeklyChart = true;
                          showMonthlyChart = false;
                          showYearlyChart = false;
                        });
                      },
                      child: Text(
                        "Week",
                        style: showWeeklyChart
                            ? themeTextBtnColor()
                            : greyTextBtnColor(),
                      ),
                    ),
                  ),
                  //  Month
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: showMonthlyChart ? bottomBorder() : null,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showDailyChart = false;
                          showWeeklyChart = false;
                          showMonthlyChart = true;
                          showYearlyChart = false;
                        });
                      },
                      child: Text(
                        "Month",
                        style: showMonthlyChart
                            ? themeTextBtnColor()
                            : greyTextBtnColor(),
                      ),
                    ),
                  ),
                  //  All Time
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: showYearlyChart ? bottomBorder() : null,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showDailyChart = false;
                          showWeeklyChart = false;
                          showMonthlyChart = false;
                          showYearlyChart = true;
                        });
                      },
                      child: Text(
                        "All Time",
                        style: showYearlyChart
                            ? themeTextBtnColor()
                            : greyTextBtnColor(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Graphs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Daily stats
                  Visibility(
                    visible: showDailyChart,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        labelStyle: greyTextColor(),
                        tickPosition: TickPosition.inside,
                      ),
                      primaryYAxis: NumericAxis(
                        // isVisible: false,//hide Y-Axis

                        //Hide Labels
                        labelStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 0,
                        ),

                        tickPosition: TickPosition.inside,
                      ),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries>[
                        if (showSolarLine)
                          SplineSeries<ChartDailyData, String>(
                            dataSource: chartDailyData,
                            splineType: SplineType.cardinal,
                            xValueMapper: (ChartDailyData data, _) => data.day,
                            yValueMapper: (ChartDailyData data, _) =>
                                data.solar,
                            name: 'Solar Power',
                            color: themeColorBackground, //Line Color
                          ),
                        if (showWindPowerLine)
                          SplineSeries<ChartDailyData, String>(
                            dataSource: chartDailyData,
                            splineType: SplineType.cardinal,
                            xValueMapper: (ChartDailyData data, _) => data.day,
                            yValueMapper: (ChartDailyData data, _) =>
                                data.windPower,
                            name: 'Wind Power',
                            color: Colors.blue,
                          ),
                        if (showProviderLine)
                          SplineSeries<ChartDailyData, String>(
                            dataSource: chartDailyData,
                            splineType: SplineType.cardinal,
                            xValueMapper: (ChartDailyData data, _) => data.day,
                            yValueMapper: (ChartDailyData data, _) =>
                                data.provider,
                            name: 'Regular Provider',
                            color: Colors.red,
                          ),
                      ],
                    ),
                  ),
                  //Weekly Stats
                  Visibility(
                    visible: showWeeklyChart,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        labelStyle: greyTextColor(),
                        tickPosition: TickPosition.inside,
                      ),
                      primaryYAxis: NumericAxis(
                        // isVisible: false,//hide Y-Axis

                        //Hide Labels
                        labelStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 0,
                        ),

                        tickPosition: TickPosition.inside,
                      ),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries>[
                        if (showSolarLine)
                          SplineSeries<ChartWeeklyData, String>(
                            dataSource: chartWeeklyData,
                            splineType: SplineType.cardinal,
                            xValueMapper: (ChartWeeklyData data, _) =>
                                data.week,
                            yValueMapper: (ChartWeeklyData data, _) =>
                                data.solar,
                            name: 'Solar Power',
                            color: themeColorBackground, //Line Color
                          ),
                        if (showWindPowerLine)
                          SplineSeries<ChartWeeklyData, String>(
                            dataSource: chartWeeklyData,
                            splineType: SplineType.cardinal,
                            xValueMapper: (ChartWeeklyData data, _) =>
                                data.week,
                            yValueMapper: (ChartWeeklyData data, _) =>
                                data.windPower,
                            name: 'Wind Power',
                            color: Colors.blue,
                          ),
                        if (showProviderLine)
                          SplineSeries<ChartWeeklyData, String>(
                            dataSource: chartWeeklyData,
                            splineType: SplineType.cardinal,
                            xValueMapper: (ChartWeeklyData data, _) =>
                                data.week,
                            yValueMapper: (ChartWeeklyData data, _) =>
                                data.provider,
                            name: 'Regular Provider',
                            color: Colors.red,
                          ),
                      ],
                    ),
                  ),
                  //Monthly Stats
                  Visibility(
                    visible: showMonthlyChart,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        labelStyle: greyTextColor(),
                        tickPosition: TickPosition.inside,
                      ),
                      primaryYAxis: NumericAxis(
                        // isVisible: false,//hide Y-Axis

                        //Hide Labels
                        labelStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 0,
                        ),

                        tickPosition: TickPosition.inside,
                      ),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries>[
                        if (showSolarLine)
                          SplineSeries<ChartMonthlyData, String>(
                            dataSource: chartMonthlyData,
                            splineType: SplineType.cardinal,
                            xValueMapper: (ChartMonthlyData data, _) =>
                                data.month,
                            yValueMapper: (ChartMonthlyData data, _) =>
                                data.solar,
                            name: 'Solar Power',
                            color: themeColorBackground, //Line Color
                          ),
                        if (showWindPowerLine)
                          SplineSeries<ChartMonthlyData, String>(
                            dataSource: chartMonthlyData,
                            splineType: SplineType.cardinal,
                            xValueMapper: (ChartMonthlyData data, _) =>
                                data.month,
                            yValueMapper: (ChartMonthlyData data, _) =>
                                data.windPower,
                            name: 'Wind Power',
                            color: Colors.blue,
                          ),
                        if (showProviderLine)
                          SplineSeries<ChartMonthlyData, String>(
                            dataSource: chartMonthlyData,
                            splineType: SplineType.cardinal,
                            xValueMapper: (ChartMonthlyData data, _) =>
                                data.month,
                            yValueMapper: (ChartMonthlyData data, _) =>
                                data.provider,
                            name: 'Regular Provider',
                            color: Colors.red,
                          ),
                      ],
                    ),
                  ),
                  //Yearly Stats
                  Visibility(
                    visible: showYearlyChart,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        labelStyle: greyTextColor(),
                        tickPosition: TickPosition.inside,
                      ),
                      primaryYAxis: NumericAxis(
                        // isVisible: false,//hide Y-Axis

                        //Hide Labels
                        labelStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 0,
                        ),

                        tickPosition: TickPosition.inside,
                      ),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries>[
                        if (showSolarLine)
                          SplineSeries<ChartYearlyData, int>(
                            dataSource: chartYearlyData,
                            splineType: SplineType.cardinal,
                            xValueMapper: (ChartYearlyData data, _) =>
                                data.year,
                            yValueMapper: (ChartYearlyData data, _) =>
                                data.solar,
                            name: 'Solar Power',
                            color: themeColorBackground, //Line Color
                          ),
                        if (showWindPowerLine)
                          SplineSeries<ChartYearlyData, int>(
                            dataSource: chartYearlyData,
                            splineType: SplineType.cardinal,
                            xValueMapper: (ChartYearlyData data, _) =>
                                data.year,
                            yValueMapper: (ChartYearlyData data, _) =>
                                data.windPower,
                            name: 'Wind Power',
                            color: Colors.blue,
                          ),
                        if (showProviderLine)
                          SplineSeries<ChartYearlyData, int>(
                            dataSource: chartYearlyData,
                            splineType: SplineType.cardinal,
                            xValueMapper: (ChartYearlyData data, _) =>
                                data.year,
                            yValueMapper: (ChartYearlyData data, _) =>
                                data.provider,
                            name: 'Regular Provider',
                            color: Colors.red,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //  Check Boxes for what to display inside the graph
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showWindPowerLine = showWindPowerLine ? false : true;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: Colors.blue,
                          activeColor: Colors.transparent,
                          side: MaterialStateBorderSide.resolveWith(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return const BorderSide(color: Colors.blue);
                              }
                            },
                          ),
                          value: showWindPowerLine,
                          onChanged: (value) {
                            setState(() {
                              showWindPowerLine = value!;
                            });
                          },
                        ),
                        Text(
                          'Wind Power',
                          style: greyTextColor(),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          showSolarLine = showSolarLine ? false : true;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            checkColor: themeColorBackground,
                            activeColor: Colors.transparent,
                            side: MaterialStateBorderSide.resolveWith(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return BorderSide(
                                      color: themeColorBackground);
                                }
                              },
                            ),
                            value: showSolarLine,
                            onChanged: (value) {
                              setState(() {
                                showSolarLine = value!;
                              });
                            },
                          ),
                          Text(
                            'Solar Power',
                            style: greyTextColor(),
                          ),
                        ],
                      )),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showProviderLine = showProviderLine ? false : true;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: Colors.red,
                          activeColor: Colors.transparent,
                          side: MaterialStateBorderSide.resolveWith(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return const BorderSide(color: Colors.red);
                              }
                            },
                          ),
                          value: showProviderLine,
                          onChanged: (value) {
                            setState(() {
                              showProviderLine = value!;
                            });
                          },
                        ),
                        Text(
                          'Reg Provider',
                          style: greyTextColor(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 50,
            )
          ],
        )
      ]),
    );
  }
}

//Classes For Charts
class ChartDailyData {
  final String day;
  final double solar;
  final double windPower;
  final double provider;

  ChartDailyData(this.day, this.solar, this.windPower, this.provider);
}

class ChartWeeklyData {
  final String week;
  final double solar;
  final double windPower;
  final double provider;

  ChartWeeklyData(this.week, this.solar, this.windPower, this.provider);
}

class ChartMonthlyData {
  final String month;
  final double solar;
  final double windPower;
  final double provider;

  ChartMonthlyData(this.month, this.solar, this.windPower, this.provider);
}

class ChartYearlyData {
  final int year;
  final double solar;
  final double windPower;
  final double provider;

  ChartYearlyData(this.year, this.solar, this.windPower, this.provider);
}
