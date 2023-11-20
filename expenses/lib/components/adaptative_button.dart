import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expenses/components/transaction_list.dart';
import 'dart:io';
import 'dart:ui';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(
        child: Text(label),
        onPressed: () => onPressed,
        color: Theme.of(context).primaryColor,
      );
    } else {
      return TextButton(
          child: Text(label),
          onPressed: () => onPressed,
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 218, 145, 231),
          ));
    }
  }
}
