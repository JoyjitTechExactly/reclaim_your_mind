import 'package:flutter/cupertino.dart';
import 'package:authentication/src/view/widgets/button_widget.dart';
import 'package:authentication/theme/color/auth_colors.dart';
import 'package:authentication/theme/extensions/style_extensions.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AuthColors.backgroundLight,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.h,
            showAppBarBackBtn(
              context: context,
              backBtnListener: () => Navigator.pop(context),
            ),
            40.h,
            Center(
              child: Text(
                'Create Account',
                style: TextStyle().heading26Blue,
                textAlign: TextAlign.center,
              ),
            ),
            12.h,
            Center(
              child: Text(
                'Sign up to get started',
                style: TextStyle().subHeadingBlack,
                textAlign: TextAlign.center,
              ),
            ),
            60.h,
            Center(
              child: Text(
                'SignUp form coming soon',
                style: TextStyle().bodyBlack,
                textAlign: TextAlign.center,
              ),
            ),
            30.h,
          ],
        ),
      ),
    );
  }
}