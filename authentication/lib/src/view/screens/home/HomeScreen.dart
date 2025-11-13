import 'package:authentication/theme/color/auth_colors.dart';
import 'package:authentication/theme/extensions/style_extensions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AuthColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AuthColors.backgroundLight,
        elevation: 0,
        title: Text('Home', style: TextStyle().heading26Blue),
        centerTitle: true,
      ),
      body: SafeArea(child: const Center(child: Text('Welcome to Home!'))),
    );
  }
}
