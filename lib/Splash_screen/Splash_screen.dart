import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../authform/signin_screen.dart';
import '../features/dash_board.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset("assets/images/a3.png"),
          const Text('Manga Ann', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),)
        ],
      ),
      backgroundColor: Colors.blue, 
      nextScreen: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return const DashBoardScreen();
          }
          return const SignInScreen();
        }),
      splashIconSize: 250,
      splashTransition: SplashTransition.fadeTransition,
      // duration: 2000,
        );
  }
}