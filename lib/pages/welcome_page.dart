import 'package:flutter/material.dart';
import '../../widgets/dropdown_button_img_txt.dart';
import '../widgets/background_tigo.dart';
import '../widgets/button_styles.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundTigo(
      child: Stack(
        children: <Widget>[
          Container(
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/group1964.png'),
              ),
            ),
          ),
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
            margin: const EdgeInsets.fromLTRB(40, 160, 40, 20),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 179, 177, 177),
                  offset: Offset(
                    0.04,
                    0.02,
                  ),
                  blurRadius: 50.0,
                  spreadRadius: 0.03,
                ),
              ],
            ),
            child: Card(
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
                  flex: 6,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          DropdownButtonImgTxt(),
                          TextButton.icon(
                            style: textButtonStyle,
                            onPressed: () => {},
                            icon: const Icon(
                              Icons.mail_outline,
                            ),
                            label: const Text(
                              'Iniciar con correo electrónico',
                            ),
                          ),
                          TextButton.icon(
                            style: textButtonStyle,
                            onPressed: () => {},
                            icon: const Icon(
                              Icons.phone_outlined,
                            ),
                            label: const Text(
                              'Iniciar con número de teléfono',
                            ),
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                            color: Colors.grey,
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          const Text('¿No tienes una cuenta?'),
                          ElevatedButton(
                            onPressed: null,
                            child: const Text(
                              'Crear una cuenta Tigo Money',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff363853)),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
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
