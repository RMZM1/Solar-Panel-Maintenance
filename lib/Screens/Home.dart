import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:solarcleaningpractice/Screens/DiviceStatus.dart';
import 'package:solarcleaningpractice/Screens/SetSchedule.dart';
import 'package:solarcleaningpractice/Screens/SolarScreening.dart';
import 'package:solarcleaningpractice/Screens/StartCleaning.dart';
import 'package:solarcleaningpractice/Screens/Statistics.dart';

import '../Style.dart';

class HomeScreen extends StatefulWidget {

  static int selectedIndex = 0;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Device> devices = [
    Device("Device One", "Solar Flare", "1-260KWh/Month", "100%", "2023-11-09", "Clean"),
    Device("Device Two", "Solar Flare", "1-260KWh/Month", "100%",  "2023-11-09", "Dirty"),
    Device("Device Three", "Solar Flare", "1-260KWh/Month", "100%", "2023-11-09", "Dusty"),
    Device("Device Four", "Solar Flare", "1-260KWh/Month", "100%",  "2023-11-09", "Stains"),
  ];
  int totalDevices = 0;
  bool mode = false; //auto/manual

  @override
  void initState() {
    totalDevices = devices.length;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(
                child: Text(
          "",
        ))),
        body: Stack(
          children: [
            //Background Image TODO
            Container(
              decoration: BoxDecoration(color: Colors.white),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  //Settings Button
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.settings,
                            color: Colors.grey,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Add Device and Your device Heading
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Devices",
                          style: blackHeadingText(),
                        ),

                        TextButton(
                            onPressed: (){},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: themeColorForeground,
                                  size: 20,),
                                Text(
                                  "Add",
                                  style: TextStyle(color: themeColorForeground),
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                  ),


                  FlutterCarousel.builder(
                    options: CarouselOptions(
                      height: 220.0,
                      showIndicator: true,
                      initialPage: HomeScreen.selectedIndex,
                      floatingIndicator: true,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      slideIndicator: CircularSlideIndicator(),
                    ),
                    itemCount: totalDevices,
                    itemBuilder: (BuildContext context, int index, int realIndex) {
                      return DeviceWidget(device: devices[index], index: index, selectedIndex: HomeScreen.selectedIndex);
                    },

                  ),



                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 8.0),
                          child: Text(
                            "Auto",
                            style: greyTextColor(),
                          ),
                        ),
                        Row(
                          children: [
                            FlutterSwitch(
                                width: 70,
                                height: 30,
                                toggleColor: Colors.white, //thumb color
                                activeColor: themeColorBackground,
                                inactiveColor: themeColorBackground2,
                                value: mode,
                                onToggle: (bool value) {
                                  setState(() {
                                    mode = value;
                                  });
                                }),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                              child: Text(
                                "Manual",
                                style: greyTextColor(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //Set Schedule
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: textButtonContainerDecoration(),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SetScheduleScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: themeColorBackground,
                                child: const Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 2, 2, 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Set Schedule",
                                      style: blackHeadingText(),
                                    ),
                                    Text(
                                      "Set Your Schedule",
                                      style: greyTextColor(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: themeColorForeground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Start Cleaning
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: textButtonContainerDecoration(),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StartCleaningScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: themeColorBackground,
                                child: const Icon(
                                  Icons.play_arrow_outlined,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 2, 2, 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Start Cleaning",
                                      style: blackHeadingText(),
                                    ),
                                    Text(
                                      "Start Cleaning Directly",
                                      style: greyTextColor(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: themeColorForeground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //View Solar Screening
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: textButtonContainerDecoration(),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ViewSolarScreening()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: themeColorBackground,
                                child: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 2, 2, 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "View Solar Screening",
                                      style: blackHeadingText(),
                                    ),
                                    Text(
                                      "View Solar Screening after every 30 minutes",
                                      style: greyTextColor(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: themeColorForeground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Stats
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: textButtonContainerDecoration(),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StatisticsScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: themeColorBackground,
                                child: const Icon(
                                  Icons.bar_chart_outlined,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 2, 2, 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Statistics",
                                      style: blackHeadingText(),
                                    ),
                                    Text(
                                      "Proper daily Statistics",
                                      style: greyTextColor(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: themeColorForeground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class Device {
  final String deviceName;
  final String companyName;
  final String consumption;
  final String coverage;
  final String dateAdded;
  final String status;

  Device(
      this.deviceName,
      this.companyName,
      this.consumption,
      this.coverage,
      this.dateAdded,
      this.status
      );
}


class DeviceWidget extends StatefulWidget {
  final Device device;
  final int index;
  final int selectedIndex;
  const DeviceWidget({Key? key, required this.device, required this.index, required this.selectedIndex}) : super(key: key);

  @override
  State<DeviceWidget> createState() => _DeviceWidgetState();
}

class _DeviceWidgetState extends State<DeviceWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          HomeScreen.selectedIndex = widget.index;
        });

        Navigator.push(context, MaterialPageRoute(builder: (context)=>StatusScreen(device: widget.device)));
      },
      child: Container(
        width: 320,
        margin: const EdgeInsets.fromLTRB(20, 5, 5, 5),
        padding: const EdgeInsets.all(20),
        decoration: widget.selectedIndex == widget.index ? deviceContainerOnFront() : deviceContainerOthers(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.device.deviceName,style: widget.selectedIndex == widget.index ? whiteHeadingText(): blackHeadingText(),),
            Text(widget.device.companyName,style: widget.selectedIndex == widget.index ? whiteTextColor():greyTextColor(),),
            const SizedBox(
              height: 1,
            ),
            Divider(
              thickness: 2,
              color: widget.selectedIndex == widget.index ? themeColorForeground2 : themeColorForeground,
            ),
            const SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex:2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("1-260kWh/Month",style: widget.selectedIndex == widget.index ?whiteHeadingText():blackHeadingText(),),
                      Text("Consumption",style: widget.selectedIndex == widget.index ?whiteTextColor():greyTextColor(),),
                      Divider(
                        thickness: 2,
                        color: widget.selectedIndex == widget.index ? themeColorForeground2 : themeColorForeground,
                        indent: 0,
                        endIndent: 50,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("100%",style: widget.selectedIndex == widget.index ?whiteHeadingText():blackHeadingText(),),
                      Text("Coverage",style: widget.selectedIndex == widget.index ?whiteTextColor():greyTextColor(),),
                      Divider(
                        thickness: 2,
                        color: widget.selectedIndex == widget.index ? themeColorForeground2 : themeColorForeground,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text("2023-11-09",style: widget.selectedIndex == widget.index ?whiteHeadingText():blackHeadingText(),),
            Text("Asset Added",style: widget.selectedIndex == widget.index ?whiteTextColor():greyTextColor(),),
          ],
        ),

      ),
    );
  }
}
