import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_tigomoney2_0_mobile_login/pages/login_page.dart';
import 'package:wallet_tigomoney2_0_mobile_login/widgets/login_scaffold.dart';


class IntroPage extends StatefulWidget{

  @override 
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  void _EndOnboarding(context){
    Navigator.pop(context);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_)=>LoginPage())
    );
  }

  void _saveStateAndNavigate() {
   
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("is_first_run", false);
      },
    );
   
    Modular.to.push(MaterialPageRoute(builder: (context) => LoginPage()));
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
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final availableWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;
    return LoginScaffold(
      cardChild: Column(
        children: [
           Container(
            height: totalHeight * 0.70,
            padding: EdgeInsets.only(
                top: availableWidth * 0.025,
                right: availableWidth * 0.05,
                bottom: availableWidth * 0.005,
                left: availableWidth * 0.05),

            child: IntroductionScreen(
                    showDoneButton: true,
                    showSkipButton: true,
                    showNextButton: true,
                    next:Text('>'),
                    skip: Text ('<'),
                    done: const Text("Comenzar", style: TextStyle(fontWeight: FontWeight.w600,color:Color(0xFFFFFFFF), fontSize: 14.0,)),
                    controlsMargin: const EdgeInsets.all(06),

                    
                    dotsDecorator: const DotsDecorator(
                      size: Size(8.0, 8.0), //size of dots
                      color: Color(0xFFCFD5DC), //color of dots
                      activeSize: Size(8.0, 8.0),
                      //activeColor: Colors.white, //color of active dot
                      activeShape: RoundedRectangleBorder( //shave of active dot
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                    ),

                    nextStyle: TextButton.styleFrom( 
                      minimumSize:Size(48.0, 48.0) ,
                      maximumSize: Size(48.0, 48.0),
                      backgroundColor:Color.fromARGB(255, 253, 251, 253),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                     
                    ),
                    ), 

                    skipStyle: TextButton.styleFrom( 
                      minimumSize:Size(48.0, 48.0) ,
                      maximumSize: Size(48.0, 48.0),
                      backgroundColor:Color.fromARGB(255, 253, 251, 253),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
              
                    ),
                    ),
                    
                    doneStyle: TextButton.styleFrom(
                      
                      alignment: Alignment.center,
                      minimumSize:Size(192.0, 48.0) ,
                      maximumSize: Size(192.0, 48.0),
                      backgroundColor:Color(0xFF343C46) ,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    ),
                    onDone: (){
                      _saveStateAndNavigate();
                    },

                    
                    
                    pages: getPages()
                ),
            ),
          
        ],
      ),
    );
  }
/*
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
  }*/
}