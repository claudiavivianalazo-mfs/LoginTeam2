import 'package:flutter/material.dart';

import 'appbar_login.dart';

class LoginScaffold extends StatelessWidget {
  LoginScaffold({
    Key? key,
    required this.cardChild,
  }) : super(key: key);
  final PreferredSizeWidget appbarLogin = AppbarLogin();
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double notAvailableHeight =
        appbarLogin.preferredSize.height + MediaQuery.of(context).padding.top;
    double availableHeight = totalHeight - notAvailableHeight;
    double availableWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appbarLogin,
        body: Stack(
          children: [
            Container(
              height: totalHeight * 0.45,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/loginBackground.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: notAvailableHeight + (availableHeight * 0.025),
                    left: availableWidth * 0.03,
                    right: availableWidth * 0.03),
                height: availableHeight,
                child: Card(
                  elevation: 0.0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: cardChild,
                ),
              ),
            ),
          ],
        ));
  }
}
