import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/dropdown_button_img_txt.dart';
import '../widgets/background_tigo.dart';
import '../widgets/button_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff363853);
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final availableWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;

    SizeConfig().init(context);
    return BackgroundTigo(
      child: Stack(
        children: <Widget>[
          Container(
            height: SizeConfig.blockSizeVertical * 40,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/loginBackground.png'),
              ),
            ),
          ),
          //SvgPicture.asset('assets/images/Group_1964.svg', fit: BoxFit.contain),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: SizeConfig.screenHeight * 0.065,
                horizontal: SizeConfig.screenWidth * 0.10),
            width: availableWidth * 0.18,
            height: availableWidth * 0.18,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/tigo1.png'),
              ),
            ),
          ),
          Container(
            /// Container del card
            margin: const EdgeInsets.fromLTRB(20, 160, 20, 20),
            width: SizeConfig.blockSizeHorizontal * 98,
            height: SizeConfig.blockSizeVertical * 70,
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: totalHeight * 0.094),
                            child: DropdownButtonImgTxt(),
                          ),
                          Container(
                            width: double.infinity,
                            height: 46,
                            margin: EdgeInsets.only(
                                top: totalHeight * 0.042,
                                bottom: totalHeight * 0.012,
                                left: availableWidth * 0.05,
                                right: availableWidth * 0.05),
                            child: OutlinedButton.icon(
                              label: Text('Iniciar con correo electr??nico',
                                  style: TextStyle(
                                    color: const Color.fromRGBO(52, 60, 70, 1),
                                    fontSize: (16 * textScaleFactor),
                                  )),
                              style: textButtonStyle,
                              onPressed: () {
                                Modular.to.pushNamed('/loginEmail');
                              },
                              icon: const Icon(
                                Icons.mail_outline,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 46,
                            margin: EdgeInsets.only(
                                top: totalHeight * 0.018,
                                bottom: totalHeight * 0.012,
                                left: availableWidth * 0.05,
                                right: availableWidth * 0.05),
                            child: OutlinedButton.icon(
                              style: textButtonStyle,
                              onPressed: () {
                                Modular.to.pushNamed('/loginPhonePin');
                              },
                              icon: const Icon(
                                Icons.phone_outlined,
                              ),
                              label: Text(
                                'Iniciar con n??mero de tel??fono',
                                style: TextStyle(
                                  color: const Color.fromRGBO(52, 60, 70, 1),
                                  fontSize: (16 * textScaleFactor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Divider(
                            height: 10,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            child: Text(
                              '??No tienes una cuenta?',
                              style: TextStyle(
                                color: const Color.fromRGBO(52, 60, 70, 1),
                                fontSize: (18 * textScaleFactor),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 46,
                            margin: EdgeInsets.only(
                                top: totalHeight * 0.018,
                                left: availableWidth * 0.05,
                                right: availableWidth * 0.05),
                            child: ElevatedButton(
                              onPressed: () {
                                Modular.to.pushNamed('/signin');
                              },
                              child: Text('Crear una cuenta Tigo Money',
                                  style: TextStyle(
                                    //color: const Color.fromRGBO(52, 60, 70, 1),
                                    fontSize: (16 * textScaleFactor),
                                  )),
                              style: elevatedButtonStyle,
                            ),
                          ),
                        ],
                      )),
                ),
              ]),
            ),
          ),
          Container(
            width: double.infinity,
            height: 220,
            margin: const EdgeInsets.fromLTRB(20, 60, 4, 40),
            //child: SvgPicture.asset('assets/images/climber.svg'),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/climber.png',
                  //package: 'wallet_tigomoney2_0_mobile_login'
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}
