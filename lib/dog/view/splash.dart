import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../2nd hand/google login/first_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  checkAuth() {
    Future.delayed(Duration(seconds: 8), () {
      Get.off(() => FirstScreen());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            Text(
              "Welcome to Dog Apps",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(
              flex: 1,
            ),
            Image.network(
              'https://imgs.search.brave.com/f8yBs4Wb4fWpD7VFsymt_F_o3gNNn61JLZI0SkXE3iQ/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9zdDIu/ZGVwb3NpdHBob3Rv/cy5jb20vMjIyMjAy/NC81ODE5L2kvNjAw/L2RlcG9zaXRwaG90/b3NfNTgxOTk3OTkt/c3RvY2stcGhvdG8t/YmVhdXRpZnVsLWhh/cHB5LXJlZGRpc2gt/aGF2YW5lc2UtcHVw/cHkuanBn',
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
            ),
            Spacer(
              flex: 3,
            ),
            Lottie.asset(
              'images/dog.json',
              height: 100,
              width: 100,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
