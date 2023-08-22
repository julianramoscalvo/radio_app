import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;

  const ErrorDialog({
    super.key,
    required this.title,
    required this.content,
    this.buttonText = 'OK',
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(buttonText),
              ),
            ],
          )
        : CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(buttonText),
              ),
            ],
          );
  }
}
