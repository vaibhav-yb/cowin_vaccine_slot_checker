import 'package:flutter/material.dart';

Future<void> showDialog(BuildContext context, String popUntilRoute) async {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 250,
          child: Container(
            child: Column(
              children: [
                Text(
                  'No Centers available!',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName(popUntilRoute));
                  },
                ),
              ],
            ),
          ),
          margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
          decoration: BoxDecoration(
            color: Color(0xffa87de8),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}