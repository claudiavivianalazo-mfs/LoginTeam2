import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/dropdown_button_img_txt.dart';
import '../widgets/background_tigo.dart';
import '../widgets/button_styles.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BackgroundTigo(
      child: Stack(
        children: <Widget>[
          Container(
            height: SizeConfig.blockSizeVertical * 40,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/loginBackground.png'),
              ),
            ),
          ),
          //SvgPicture.asset('assets/images/Group_1964.svg', fit: BoxFit.contain),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
            width: 70,
            height: 70,
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
            width: SizeConfig.blockSizeHorizontal * 100,
            height: SizeConfig.blockSizeVertical * 70,
            // decoration: const BoxDecoration(),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
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
                            margin: const EdgeInsets.only(top: 70),
                            child: DropdownButtonImgTxt(),
                          ),
                          Container(
                            width: double.infinity,
                            height: 46,
                            margin: const EdgeInsets.only(
                                top: 30, bottom: 10, left: 15, right: 15),
                            child: TextButton.icon(
                              label:
                                  const Text('Iniciar con correo electrónico'),
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
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 15, right: 15),
                            child: TextButton.icon(
                              style: textButtonStyle,
                              onPressed: () => {},
                              icon: const Icon(
                                Icons.phone_outlined,
                              ),
                              label: const Text(
                                'Iniciar con número de teléfono',
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
                            child: const Text('¿No tienes una cuenta?'),
                          ),
                          Container(
                            width: double.infinity,
                            height: 46,
                            margin: const EdgeInsets.only(
                                top: 4, left: 15, right: 15),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                'Crear una cuenta Tigo Money',
                              ),
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
            height: 200,
            margin: const EdgeInsets.fromLTRB(46, 80, 20, 46),
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
