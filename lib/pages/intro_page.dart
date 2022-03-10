import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wallet_tigomoney2_0_mobile_login/pages/login_page.dart';


class IntroPage extends StatefulWidget{

  @override 
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  void _EndWellcomePage(context){
    Navigator.pop(context);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_)=>LoginPage())
    );
  }

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset("assets/images/onboarding.png"),
        title: "Envía y recibe dinero muy facil",
        body: "Tigo Money App te permite realizar transacciones de forma rápida y segura estés donde estés",
        decoration: const PageDecoration(
        titleTextStyle: TextStyle(color: Color(0xFF343C46),fontWeight: FontWeight.w600, fontSize: 24.0, fontFamily: "Readex Pro", ),
        bodyTextStyle: TextStyle(color:Color(0xFF343C46),fontWeight: FontWeight.w300, fontSize: 14.0, fontFamily: "Readex Pro",),
      ),
        
      ),
      PageViewModel(
        image: Image.asset("assets/images/onboarding.png"),
        title: "Envía y recibe dinero muy facil",
        body: "Tigo Money App te permite realizar transacciones de forma rápida y segura estés donde estés",
        decoration: const PageDecoration(
        titleTextStyle: TextStyle(color: Color(0xFF343C46),fontWeight: FontWeight.w600, fontSize: 24.0, fontFamily: "Readex Pro", ),
        bodyTextStyle: TextStyle(color:Color(0xFF343C46),fontWeight: FontWeight.w300, fontSize: 14.0, fontFamily: "Readex Pro",),
      ),
        
      ),
      PageViewModel(
        image: Image.asset("assets/images/onboarding.png"),
        title: "Envía y recibe dinero muy facil",
        body: "Tigo Money App te permite realizar transacciones de forma rápida y segura estés donde estés",
        decoration: const PageDecoration(
        titleTextStyle: TextStyle(color: Color(0xFF343C46),fontWeight: FontWeight.w600, fontSize: 24.0, fontFamily: "Readex Pro", ),
        bodyTextStyle: TextStyle(color:Color(0xFF343C46),fontWeight: FontWeight.w300, fontSize: 14.0, fontFamily: "Readex Pro",),
      ),
        
      ),
     
    ];
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body:BackgroundTigo(
        child: IntroductionScreen(
        showDoneButton: true,
        showSkipButton: true,
        showNextButton: true,
        next:Text('>>'),
        skip: Text ('<<'),
        done: Text('Comenzar'),
        
        onDone: (){
          _EndWellcomePage(context);
         
        },
        onSkip: (){
          _EndWellcomePage(context);
        },
        pages: getPages()
        
      ),
      
      ) 
    );
  }
}