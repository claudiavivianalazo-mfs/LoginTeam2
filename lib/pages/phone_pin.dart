import 'package:flutter/material.dart';

class PhonePinScreen extends StatefulWidget {
   
  const PhonePinScreen({Key? key}) : super(key: key);

  @override
  State<PhonePinScreen> createState() => _PhonePinScreenState();
}

class _PhonePinScreenState extends State<PhonePinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
        child: Column(
          children: const [
            Text('Phone + Pin')
          ],
        ),
      ),
    );
  }
}