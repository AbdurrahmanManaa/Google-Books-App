import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomeErrorMessage extends StatelessWidget {
  const CustomeErrorMessage({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: Styles.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
