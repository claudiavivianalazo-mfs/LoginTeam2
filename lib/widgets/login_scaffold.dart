import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: appbarLogin,
        body: Stack(
          children: [
            SizedBox(
              height: totalHeight * 0.38,
              width: double.infinity,
              child: SvgPicture.asset(
                "assets/images/loginBackground.svg",
                fit: BoxFit.fill,
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
