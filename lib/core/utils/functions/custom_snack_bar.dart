import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

void customSnackBar(context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: Styles.textStyle16,
        selectionColor: Colors.white,
      ),
      backgroundColor: Colors.red,
      duration: const Duration(
        seconds: 3,
      ),
    ),
  );
}
