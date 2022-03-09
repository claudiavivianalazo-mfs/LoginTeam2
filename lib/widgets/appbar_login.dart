import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppbarLogin extends StatelessWidget implements PreferredSizeWidget {
  AppbarLogin({Key? key}) : super(key: key);
  final AppBar appBar = AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Image(image: AssetImage("assets/images/frame.png")),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () => Modular.to.pop(),
        icon: const Icon(
          Icons.arrow_back,
          color: Color(0xff001C40),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help_outline,
              color: Color(0xff343C46),
            )),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
