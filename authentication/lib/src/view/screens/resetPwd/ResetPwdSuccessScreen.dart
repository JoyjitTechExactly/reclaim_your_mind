import 'package:authentication/src/view/screens/auth/SignInScreen.dart';
import 'package:authentication/src/view/widgets/button_widget.dart';
import 'package:authentication/theme/color/auth_colors.dart';
import 'package:authentication/theme/extensions/style_extensions.dart';
import 'package:flutter/material.dart';

class ResetPwdSuccessScreen extends StatelessWidget {
  const ResetPwdSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AuthColors.backgroundLight,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /** Success Image*/
              Icon(
                Icons.check_circle_rounded,
                size: 150,
                color: AuthColors.validationPasswordColor,
              ),

              /*Top spacing*/
              32.h,

              /* Heading */
              Center(
                child: Text(
                  'Password Created Successfully!',
                  style: TextStyle().heading26Blue,
                  textAlign: TextAlign.center,
                ),
              ),

              /* Subheading */
              12.h,
              Center(
                child: Text(
                  'Your new password has been set. You can now log in to your Verticast account and start exploring casting opportunities.',
                  style: TextStyle().subHeadingBlack,
                  textAlign: TextAlign.center,
                ),
              ),

              /*Spacing*/
              32.h,

              /* Login Button */
              showCustomButton(
                context: context,
                text: 'Log In',
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const SignInScreen()),
                  (route) => false,
                ),
                bgColor: AuthColors.defaultButtonColor,
                borderRadius: 5,
              ),

              /* Bottom Spacing */
              30.h,
            ],
          ),
        ),
      ),
    );
  }
}
