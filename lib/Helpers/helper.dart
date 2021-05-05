import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog universalLoader;

pushReplacement(BuildContext context, Widget destination) {
  Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => destination,
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 300),
      ));
}

push(BuildContext context, Widget destination) {
  Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => destination,
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 300),
      ));
}

pop(BuildContext context) {
  Navigator.pop(context);
}

void snackbarCommon(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
    msg,
    style: TextStyle(color: Colors.white),
  )));
}
