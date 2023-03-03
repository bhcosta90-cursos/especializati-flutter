import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash_screen/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    _checkAuth().then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Container space = Container(
      height: 40,
    );

    return Scaffold(
        body: Container(
            width: double.maxFinite,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 250,
                    child: Image.asset(
                        'assets/images/logo-especializati-branca2.png')),
                space,
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(Colors.orange),
                ),
                space,
                Text("Carregando...",
                    style: TextStyle(color: Colors.white, fontSize: 25))
              ],
            )));
  }

  Future<void> _checkAuth() async {
    await Future.delayed(Duration(seconds: 3));
  }
}
