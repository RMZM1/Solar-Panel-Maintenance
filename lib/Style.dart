import 'package:flutter/material.dart';

Color themeColorBackground = const Color.fromRGBO(80, 98, 160, 1.0);
Color themeColorForeground =
    Colors.blueGrey; //Home screen used in => + Add and >
Color themeColorBackground2 = const Color.fromRGBO(232, 232, 232, 1.0);
Color themeColorForeground2 = const Color.fromRGBO(232, 232, 232, 1.0);

//Navigation Button on home screen (set schedule)
BoxDecoration textButtonContainerDecoration() {
  return BoxDecoration(
    color: themeColorBackground2,
    border: Border.all(
        color: Colors.transparent, width: 2, style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(10),
  );
}

BoxDecoration deviceContainerOnFront() {
  return BoxDecoration(
    color: themeColorBackground,
    border: Border.all(
        color: Colors.transparent, width: 2, style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(10),
  );
}

BoxDecoration deviceContainerOthers() {
  return BoxDecoration(
    color: themeColorBackground2,
    border: Border.all(
        color: Colors.transparent, width: 2, style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(10),
  );
}

TextStyle blackHeadingText() {
  return const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.black,
  );
}

TextStyle greyTextColor() {
  return TextStyle(fontSize: 11, color: themeColorForeground);
}

TextStyle greyTextBtnColor() {
  return TextStyle(fontSize: 16, color: themeColorForeground);
}

TextStyle themeTextBtnColor() {
  return TextStyle(fontSize: 16, color: themeColorBackground);
}

TextStyle whiteTextColor() {
  return TextStyle(fontSize: 11, color: themeColorForeground2);
}

TextStyle redTextColor() {
  return const TextStyle(fontSize: 11, color: Colors.red);
}

TextStyle whiteHeadingText() {
  return const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.white,
  );
}

TextStyle whTextStatistics() {
  return const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 40,
    color: Colors.black,
  );
}

TextStyle appBarTitle() {
  return const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: Colors.black,
  );
}

ButtonStyle actionBtnWithThemeColor() {
  return ElevatedButton.styleFrom(
    backgroundColor: themeColorBackground,
    shadowColor: Colors.black,
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // <-- Radius
    ),
  );
}

BoxDecoration calenderMainButtonsDecoration() {
  return BoxDecoration(
    color: themeColorBackground,
    border: Border.all(
        color: Colors.transparent, width: 1, style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(10),
  );
}

BoxDecoration calenderOtherButtonsDecoration() {
  return BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.black, width: 1, style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(10),
  );
}

BoxDecoration bottomBorder() {
  return BoxDecoration(
    border: Border(
        bottom: BorderSide(
            color: themeColorBackground, width: 2, style: BorderStyle.solid)),
  );
}
