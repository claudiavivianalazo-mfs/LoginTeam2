import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_tigomoney2_0_mobile_login/providers/login_form_provider.dart';
import 'package:wallet_tigomoney2_0_mobile_login/services/auth_service.dart';
import 'package:wallet_tigomoney2_0_mobile_login/services/notifications_service.dart';

bool isChecked = false;
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginTigo();
}

class LoginTigo extends State<LoginPage> {
  @override
  void initState() {
    _loadUserEmailPassword();
    super.initState();
  }

  void _loadUserEmailPassword() async {
    print('Se ejecuto');
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _emailVar = _prefs.getString("email") ?? "";
      var _passwordVar = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      print(_remeberMe);
      print(_email);
      print(_password);
      if (_remeberMe) {
        setState(() {
          isChecked = true;
        });
        _email.text = _emailVar;
        _password.text = _passwordVar;
      } else {
        await _prefs.clear();
        setState(() {
          _email.clear();
          _password.clear();
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double sizedBoxGeneral = 15.0;
    return Scaffold(
        body: BackgroundTigo(
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              children: [
                ImageTigo(),
                SizedBox(
                  height: 100,
                ),
                _TextLogin(),
                SizedBox(
                  height: 50,
                ),
                ChangeNotifierProvider(
                  create: (context) => LoginFormProvider(),
                  child: _Login(),
                ),
                SizedBox(
                  height: 15,
                ),
                ChangeNotifierProvider(
                  create: (context) => LoginFormProvider(),
                  child: radioBtn(),
                ),
                SizedBox(
                  height: sizedBoxGeneral,
                ),
                Container(
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          height: 20,
                          thickness: 1,
                          indent: 0,
                          endIndent: 3,
                          color: Color(0xffBFC7D0),
                        ),
                      ),
                      Text(
                        'O',
                        style: TextStyle(color: Color(0xffBFC7D0)),
                      ),
                      Expanded(
                        child: Divider(
                          height: 20,
                          thickness: 1,
                          indent: 3,
                          endIndent: 0,
                          color: Color(0xffBFC7D0),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: sizedBoxGeneral,
                ),
                Container(
                  width: double.infinity,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      onPressed: () => {},
                      label: const Text(
                        'Iniciar sesión con Google',
                        style: TextStyle(color: Color(0xff4285F4)),
                      ),
                      icon: Image.asset(
                        'assets/images/google.png',
                        width: 30,
                        height: 30,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffFFFFFF)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: sizedBoxGeneral,
                ),
                Container(
                  width: double.infinity,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      onPressed: () => {},
                      icon: Image.asset(
                        'assets/images/Facebook.png',
                        width: 30,
                        height: 30,
                      ),
                      label: const Text(
                        'Iniciar sesión con Facebook',
                        style: TextStyle(color: Color(0xff4285F4)),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffFFFFFF)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: sizedBoxGeneral,
                ),
                const Text('¿No tienes una cuenta?'),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: const Text('Crear una cuenta Tigo Money',
                        style: TextStyle(
                            color: Color(0xff004FB6),
                            fontWeight: FontWeight.bold)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xffFFFFFF)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class ImageTigo extends StatelessWidget {
  const ImageTigo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 150,
        height: 45,
        margin: EdgeInsets.only(top: 30),
        color: Color.fromRGBO(0, 55, 124, 1),
        child: Image(image: AssetImage("assets/images/frame.png")),
      ),
    );
  }
}

class _TextLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Text(
      'Iniciar sesión',
      style: TextStyle(
          color: Color.fromRGBO(0, 55, 124, 1),
          fontFamily: "Roboto",
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: 30,
          letterSpacing: 2),
    ));
  }
}

class BackgroundTigo extends StatelessWidget {
  final Widget child;

  const BackgroundTigo({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [this.child],
        ));
  }
}

class _Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<_Login> {
  double sizedBoxGeneral = 15.0;
  bool isChecked = false;

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    // TODO: implement build
    return Container(
      //margin: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Form(
          key: loginForm.globalKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                controller: _email,
                autocorrect: false,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) async {
                  loginForm.email = value;
                },
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);

                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El valor ingresado no es un correo';
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'miguel.bonilla@correo.com',
                  labelText: 'Correo electónico',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _password,
                autocorrect: false,
                obscureText: _obscureText,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: '**********',
                  labelText: 'Contraseña',
                  suffixIcon: IconButton(
                      onPressed: () {
                        _toggle();
                      },
                      icon: Icon(Icons.visibility)),
                ),
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  if (value != null && value.length >= 6) return null;
                  return 'La contraseña debe de ser de 6 o más caracteres';
                },
              ),
              SizedBox(
                height: sizedBoxGeneral,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xffFFAB31)),
                  ),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    final authService =
                        Provider.of<AuthService>(context, listen: false);
                    if (!loginForm.isValidForm()) return;
                    SharedPreferences _prefs =
                        await SharedPreferences.getInstance();
                    if (_prefs.containsKey('email') &&
                        _prefs.containsKey('password')) {
                      _prefs.setString("email", _email.text);
                      _prefs.setString("password", _password.text);
                      loginForm.email = _prefs.getString('email')!;
                      loginForm.password = _prefs.getString('password')!;
                    }

                    if (!loginForm.email.isEmpty &&
                        !loginForm.password.isEmpty) {
                      final String? resp = await authService.login(
                          loginForm.email, loginForm.password);
                      if (resp == null) {
                        Modular.to.navigate('/home');
                      } else {
                        NotificationsService.showSnackBar(resp);
                      }
                    } else {
                      NotificationsService.showSnackBar(
                          "Ingres un correo y contraseña valido");
                    }
                  },
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(color: Color(0xff004FB6)),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class radioBtn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _radio();
}

class _radio extends State<radioBtn> {
  void _handleRemeberme(bool? value) {
    isChecked = value!;
    // var pass = encrypt(_password.text);

// if(isChecked){

    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', _email.text);
        prefs.setString('password', _password.text);
      },
    );
// }

    setState(() {
      isChecked = value;
    });

    if (!isChecked) {
      print('isChecked ${!isChecked}');
      setState(() {
        _email.clear();
        _password.clear();
      });
    }
  }

  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red;
      }
      return Colors.blue;
    }

    return Container(
      width: double.infinity,
      child: (Row(
        children: <Widget>[
          Container(
            child: Row(
              children: [
                const Text('Recordarme'),
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: _handleRemeberme,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(right: 0.0),
              child: TextButton(
                //     style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsets>(
                // EdgeInsets.only(right:0,left:5))),

                onPressed: () async {
                  final authService =
                      Provider.of<AuthService>(context, listen: false);
                  SharedPreferences _prefs =
                      await SharedPreferences.getInstance();
                  if (_email.text.isEmpty) {
                    NotificationsService.showSnackBar("Ingrese un correo");
                  } else {
                    loginForm.email = _prefs.containsKey('email')
                        ? _prefs.getString('email')!
                        : _email.text;

                    final res =
                        await authService.resetPassword(loginForm.email);

                    NotificationsService.showSnackBar(res.toString());
                  }
                },
                child: const Text(
                  'Olvidé mi contraseña',
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

// dynamic encrypt(password) {
//   final key = encryptLib.Key.fromSecureRandom(32);
//   final iv = encryptLib.IV.fromSecureRandom(16);
//   final encrypter = encryptLib.Encrypter(encryptLib.AES(key));
//   final encrypted = encrypter.encrypt(password, iv: iv);
//   print(encrypted.base64);
//   return encrypted.base64;
// }

// void decrypted(passwordEncrypted) {
//   // Codec<String, String> stringToBase64 = utf8.fuse(base64);

//   // String decoded = stringToBase64.decode(passwordEncrypted);
//   final key = encryptLib.Key.fromSecureRandom(32);
//   final iv = encryptLib.IV.fromSecureRandom(16);
//   final encrypter = encryptLib.Encrypter(encryptLib.AES(key));
//   final decrypted = encrypter
//       .decrypt(passwordEncrypted);
//   print(decrypted);
// }
