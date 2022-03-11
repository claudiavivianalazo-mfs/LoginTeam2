import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_tigomoney2_0_mobile_login/pages/intro_page.dart';
import 'package:wallet_tigomoney2_0_mobile_login/pages/signin_page.dart';


class SelectorPage extends StatefulWidget {
  const SelectorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SelectorState();
  }
}

class SelectorState extends State<SelectorPage> {
  bool isFirstRun = true;
  @override
  void initState() {
    _loadFirstState();
    super.initState();
  }

  void _loadFirstState() {
    SharedPreferences.getInstance().then(
      (prefs) {
        bool _isFirstRun = prefs.getBool("is_first_run") ?? true;
        setState(() {
          isFirstRun = _isFirstRun;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return isFirstRun ? IntroPage() : IntroPage();
  }
}
