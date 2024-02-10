import 'dart:async';

import 'package:flutter/material.dart';

import '../Style.dart';

class StartCleaningScreen extends StatefulWidget {
  const StartCleaningScreen({Key? key}) : super(key: key);

  @override
  State<StartCleaningScreen> createState() => _StartCleaningScreenState();
}

class _StartCleaningScreenState extends State<StartCleaningScreen> {

  bool isCounting = false;
  Duration duration = Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
              "Start Cleaning",
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
          TextButton(onPressed: () => {}, child: const Text(""),),
        ],
      ),
      body: Stack(
        children: [
          //Background Image TODO
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                //Play and pause Button
                !isCounting
                    ? Center(
                        child: ElevatedButton(
                            onPressed: startStop,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: const CircleBorder()),
                            child: Icon(
                              Icons.play_circle_outline,
                              size: 250,
                              color: themeColorBackground,
                            )),
                      )
                    : Center(
                        child: ElevatedButton(
                            onPressed: startStop,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: const CircleBorder()),
                            child: Icon(
                              Icons.pause_circle_outline,
                              size: 250,
                              color: themeColorBackground,
                            )),
                      ),

                //Start
                Container(
                  margin: const EdgeInsets.fromLTRB(50, 30, 5, 5),
                  child: Text(
                    "Starting Time",
                    style: blackHeadingText(),
                  ),
                ),
                //Stop Watch
                buildTime()
              ],
            ),
          ),
        ],
      ),
    );
  }

  startStop() {
    if(isCounting){
      stopTimer();
      setState(() {
        isCounting = false;
      });
    }
    else{
      startTimer();
      setState(() {
        isCounting = true;
      });

    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer(){
    setState(() {
      timer?.cancel();
    });
  }

  void addTime() {
    const addSeconds = 1;

    setState(() {
      final newSeconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: newSeconds);
    });
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Container(
        margin: const EdgeInsets.fromLTRB(50, 5, 5, 5),
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
                "$hours:$minutes:$seconds",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30
              ),
            )
        )
    );
  }
}
