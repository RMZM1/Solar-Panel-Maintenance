import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:intl/intl.dart';
import 'package:solarcleaningpractice/Style.dart';

class SetScheduleScreen extends StatefulWidget {
  const SetScheduleScreen({Key? key}) : super(key: key);

  @override
  State<SetScheduleScreen> createState() => _SetScheduleScreenState();
}

class _SetScheduleScreenState extends State<SetScheduleScreen> {
  final ScrollController _scrollController = ScrollController();

  int currentDate = DateTime.now().day.toInt();
  List<DateData> dateList = [];

  @override
  void initState() {
    dateList = generateDateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Scroll to the current date after the widget is built
      _scrollToCurrentDate();
    });

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Set Schedule",
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

        SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //Daily Button
                Container(
                  alignment: Alignment.center,
                  width: 250,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  decoration: calenderMainButtonsDecoration(),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Daily",
                          style: whiteHeadingText(),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: themeColorForeground2,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                //  Calender
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: dateList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DailyCalenderWidget(dateData: dateList[index]);
                    },
                  ),
                ),

                const SizedBox(
                  height: 200,
                ),
                //  Save Button
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: actionBtnWithThemeColor(),
                    child: Text(
                      "Save",
                      style: whiteHeadingText(),
                    ),
                  ),
                ),
                //  Weekly Button
                Container(
                  alignment: Alignment.center,
                  width: 250,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  decoration: calenderOtherButtonsDecoration(),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Weekly",
                          style: blackHeadingText(),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: themeColorForeground,
                        ),
                      ],
                    ),
                  ),
                ),
                //  Monthly Button
                Container(
                  alignment: Alignment.center,
                  width: 250,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  decoration: calenderOtherButtonsDecoration(),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Monthly",
                          style: blackHeadingText(),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: themeColorForeground,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  List<DateData> generateDateList() {
    DateTime now = DateTime.now();
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    DateFormat dayFormat = DateFormat('E');
    List<DateData> dateList = [];

    for (int i = 1; i <= daysInMonth; i++) {
      DateTime date = DateTime(now.year, now.month, i);
      String dayOfWeek = dayFormat.format(date);
      dateList.add(DateData(i, dayOfWeek));
    }

    return dateList;
  }

  void _scrollToCurrentDate() {
    int currentDay = DateTime.now().day;
    int currentIndex = dateList.indexWhere((date) => date.date == currentDay);
    if (currentIndex != -1) {
      _scrollController.animateTo(
        currentIndex * 50.0, // Adjust this value based on your item width
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}

class DateData {
  final int date;
  final String day;

  DateData(this.date, this.day);
}

class DailyCalenderWidget extends StatefulWidget {
  final DateData dateData;
  const DailyCalenderWidget({Key? key, required this.dateData})
      : super(key: key);

  @override
  State<DailyCalenderWidget> createState() => _DailyCalenderWidgetState();
}

class _DailyCalenderWidgetState extends State<DailyCalenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: widget.dateData.date == DateTime.now().day
                ? const Color.fromRGBO(80, 98, 160, 0.8)
                : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // <-- Radius
            )),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.dateData.date.toString(),
              style: widget.dateData.date == DateTime.now().day
                  ? whiteHeadingText()
                  : blackHeadingText(),
            ),
            Text(
              widget.dateData.day.toString().substring(0, 3),
              style: widget.dateData.date == DateTime.now().day
                  ? whiteTextColor()
                  : greyTextColor(),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
