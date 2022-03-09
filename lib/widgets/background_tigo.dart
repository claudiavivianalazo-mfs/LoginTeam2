import 'package:flutter/material.dart';

class BackgroundTigo extends StatelessWidget {
  final Widget child;

  const BackgroundTigo({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [child],
        ));
  }
}
