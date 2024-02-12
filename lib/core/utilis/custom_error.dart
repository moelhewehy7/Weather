import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.errormessage});
  final String errormessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errormessage,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
