import 'package:flutter/material.dart';
import 'dart:math' as math; // import this

import '../Style.dart';

class ViewSolarScreening extends StatefulWidget {
  const ViewSolarScreening({Key? key}) : super(key: key);

  @override
  State<ViewSolarScreening> createState() => _ViewSolarScreeningState();
}

class _ViewSolarScreeningState extends State<ViewSolarScreening> {
  // DropDowns for 24 12 and 1 hours
  bool hours24Opened = false;
  bool hours12Opened = false;
  bool hours1Opened = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Solar Screening",
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
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child:
                IconButton(onPressed: () => {}, icon: const Icon(Icons.replay)),
          ),
        ],
      ),
      body: Stack(
        children: [
          //Background Image TODO
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  //24 Hours
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    margin: const EdgeInsets.all(5),
                    decoration: hours24Opened ? calenderMainButtonsDecoration():calenderOtherButtonsDecoration(),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          hours24Opened = hours24Opened ? false : true;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "24 Hours",
                            style: hours24Opened ? whiteHeadingText() : blackHeadingText(),
                          ),
                          hours24Opened
                              ? const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                )
                              : const RotatedBox(
                                  quarterTurns: 3,
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  //Devices Cleaned and passed time since cleaning is greater than or equal to 24 hour
                  hours24Opened
                      ? Column(
                          children: [
                            //Two Devices per Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    padding: const EdgeInsets.all(8),
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: themeColorBackground,
                                            width: 2,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/1.jpg'),
                                            fit: BoxFit.fill)),
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          "24:45 Hours",
                                          style: whiteHeadingText(),
                                        )),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    padding: const EdgeInsets.all(8),
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: themeColorBackground,
                                            width: 2,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/2.jpg'),
                                            fit: BoxFit.fill)),
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          "28 Hours",
                                          style: whiteHeadingText(),
                                        )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      : Container(),

                  //12 Hours
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    margin: const EdgeInsets.all(5),
                    decoration: hours12Opened ? calenderMainButtonsDecoration() : calenderOtherButtonsDecoration(),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          hours12Opened = hours12Opened ? false : true;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "12 Hours",
                            style: hours12Opened ? whiteHeadingText() : blackHeadingText(),
                          ),
                          hours12Opened
                              ? const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                )
                              : const RotatedBox(
                                  quarterTurns: 3,
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  //Devices Cleaned and passed time since cleaning is greater than 1 but less than 24 hours
                  hours12Opened
                      ? Column(
                          children: [
                            //Two Devices per Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    padding: const EdgeInsets.all(8),
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: themeColorBackground,
                                            width: 2,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/3.jpg'),
                                            fit: BoxFit.fill)),
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          "23:30 Hours",
                                          style: whiteHeadingText(),
                                        )),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    padding: const EdgeInsets.all(8),
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: themeColorBackground,
                                            width: 2,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/4.jpg'),
                                            fit: BoxFit.fill)),
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          "8:50 Hours",
                                          style: whiteHeadingText(),
                                        )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      : Container(),

                  //1 Hours
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    margin: const EdgeInsets.all(5),
                    decoration: hours1Opened ? calenderMainButtonsDecoration() : calenderOtherButtonsDecoration(),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          hours1Opened = hours1Opened ? false : true;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "1 Hour",
                            style: hours1Opened ? whiteHeadingText() : blackHeadingText(),
                          ),
                          hours1Opened
                              ? const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                )
                              : const RotatedBox(
                                  quarterTurns: 3,
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  //Devices Cleaned and passed time since cleaning is less than and equal to 1 hour
                  hours1Opened
                      ? Column(
                          children: [
                            //Two Devices per Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    padding: const EdgeInsets.all(8),
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: themeColorBackground,
                                            width: 2,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/5.jpg'),
                                            fit: BoxFit.fill)),
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          "30 Minutes",
                                          style: whiteHeadingText(),
                                        )),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    padding: const EdgeInsets.all(8),
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: themeColorBackground,
                                            width: 2,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/6.jpg'),
                                            fit: BoxFit.fill)),
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          "50 Minutes",
                                          style: whiteHeadingText(),
                                        )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
