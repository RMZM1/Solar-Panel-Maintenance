import 'package:flutter/material.dart';
import 'package:solarcleaningpractice/Screens/Home.dart';

import '../Style.dart';

class StatusScreen extends StatefulWidget {
  final Device device;
  const StatusScreen({Key? key, required this.device}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  String? cleaningStatus;

  bool cleanBtnPressed = false;
  bool dirtyBtnPressed = false;
  bool dustyBtnPressed = false;
  bool stainsBtnPressed = false;

  @override
  void initState() {
    checkDefaultStatus();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Status",
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
          child: Column(
            children: [

              //Device Image
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.transparent,
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
                      "45 minutes ago",
                      style: whiteHeadingText(),
                    )),
              ),
              //  Clean Button
              Container(
                alignment: Alignment.center,
                width: 250,
                margin: const EdgeInsets.all(5),
                decoration: cleanBtnPressed ? calenderMainButtonsDecoration() : calenderOtherButtonsDecoration(),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      cleanBtnPressed = true;
                      dirtyBtnPressed = false;
                      dustyBtnPressed = false;
                      stainsBtnPressed = false;
                    });
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Clean",
                      style: cleanBtnPressed ? whiteHeadingText() : blackHeadingText(),
                    ),
                  ),
                ),
              ),
              //  Dirty Button
              Container(
                alignment: Alignment.center,
                width: 250,
                margin: const EdgeInsets.all(5),
                decoration: dirtyBtnPressed ? calenderMainButtonsDecoration() : calenderOtherButtonsDecoration(),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      cleanBtnPressed = false;
                      dirtyBtnPressed = true;
                      dustyBtnPressed = false;
                      stainsBtnPressed = false;
                    });
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Dirty",
                      style: dirtyBtnPressed ? whiteHeadingText() : blackHeadingText(),
                    ),
                  ),
                ),
              ),
              //  Dusty Button
              Container(
                alignment: Alignment.center,
                width: 250,
                margin: const EdgeInsets.all(5),
                decoration: dustyBtnPressed ? calenderMainButtonsDecoration() : calenderOtherButtonsDecoration(),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      cleanBtnPressed = false;
                      dirtyBtnPressed = false;
                      dustyBtnPressed = true;
                      stainsBtnPressed = false;
                    });
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Dusty",
                      style: dustyBtnPressed ? whiteHeadingText() : blackHeadingText(),
                    ),
                  ),
                ),
              ),
              //  Stains Button
              Container(
                alignment: Alignment.center,
                width: 250,
                margin: const EdgeInsets.all(5),
                decoration: stainsBtnPressed ? calenderMainButtonsDecoration() : calenderOtherButtonsDecoration(),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      cleanBtnPressed = false;
                      dirtyBtnPressed = false;
                      dustyBtnPressed = false;
                      stainsBtnPressed = true;
                    });
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Stains",
                      style: stainsBtnPressed ? whiteHeadingText() : blackHeadingText(),
                    ),
                  ),
                ),
              ),
              //Submit Button
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
                child: ElevatedButton(
                  onPressed: () {},
                  style: actionBtnWithThemeColor(),
                  child: Text(
                    "Submit",
                    style: whiteHeadingText(),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  void checkDefaultStatus() {
    if(widget.device.status == "Clean"){
      setState(() {
        cleanBtnPressed = true;
        dirtyBtnPressed = false;
        dustyBtnPressed = false;
        stainsBtnPressed = false;
      });
    }
    else if(widget.device.status == "Dirty"){
      setState(() {
        cleanBtnPressed = false;
        dirtyBtnPressed = true;
        dustyBtnPressed = false;
        stainsBtnPressed = false;
      });
    }
    else if(widget.device.status == "Dusty"){
      setState(() {
        cleanBtnPressed = false;
        dirtyBtnPressed = false;
        dustyBtnPressed = true;
        stainsBtnPressed = false;
      });
    }
    else if(widget.device.status == "Stains"){
      setState(() {
        cleanBtnPressed = false;
        dirtyBtnPressed = false;
        dustyBtnPressed = false;
        stainsBtnPressed = true;
      });
    }
  }
}
