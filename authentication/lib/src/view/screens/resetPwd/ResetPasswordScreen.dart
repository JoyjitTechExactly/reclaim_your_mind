import 'package:authentication/src/view/widgets/common_ui_ext.dart';
import 'package:authentication/theme/color/auth_colors.dart';
import 'package:authentication/theme/extensions/style_extensions.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AuthColors.backgroundLight,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*Spacing top*/
            100.h,
            /*Back btn*/
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 10),
              child: showBackBtn(
                backBtnListener: () {
                  Navigator.pop(context);
                },
              ),
            ),
            /*Spacing*/
            50.h,
            /*Heading*/
            Text('Reset Password', style: TextStyle().heading26Blue),
            /*Spacing*/
            6.h,
            /*Sub Heading*/
            Text(
              'Enter your email or phone number\nto reset your password',
              style: TextStyle().subHeadingBlack,
              textAlign: TextAlign.center,
            ),

            /*Input Section*/
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*Email*/
                  Text('Email', style: TextStyle().bodySmall14),
                  /*Spacing*/
                  8.h,
                  /*Email edit field*/
                  editTextField(
                    textController: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hint: 'Enter your email',
                    borderColor: AuthColors.borderColor,
                    textColor: AuthColors.defaultTextColor,
                    error: () {
                      print("Email field is empty");
                    },
                  ),
                  /*Spacing*/
                  24.h,
                  /*Sign in btn*/
                  showCustomButton(
                    context: context,
                    text: 'Send Reset Code',
                    onPressed: () {
                      print("Send Reset Code");
                    },
                    bgColor: AuthColors.defaultButtonColor,
                    borderRadius: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
