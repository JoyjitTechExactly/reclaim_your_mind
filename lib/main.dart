import 'package:flutter/material.dart';
import 'package:authentication/src/view/screens/auth/SignInScreen.dart';
import 'package:reclaim_your_mind/src/view/screens/HomeScreen.dart';
import 'package:authentication/src/view/screens/auth/SignUpScreen.dart';
import 'package:authentication/src/view/screens/onboard/OnboardScreen.dart';
import 'package:authentication/src/view/screens/resetPwd/ResetPasswordScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reclaim Your Mind',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/onboard': (context) => const OnboardScreen(),
        '/login': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/resetPassword': (context) => const ResetPasswordScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}