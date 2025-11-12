import 'package:authentication/src/view/widgets/button_widget.dart';
import 'package:authentication/theme/color/auth_colors.dart';
import 'package:authentication/theme/extensions/style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:authentication/src/view/screens/home/HomeScreen.dart';

import '../../widgets/edit_text_field_widget.dart';
import '../resetPwd/ResetPasswordScreen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AuthColors.backgroundLight,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Top Spacing */
            50.h,

            /* Back Button */
            showAppBarBackBtn(
              context: context,
              backBtnListener: () => Navigator.pop(context),
            ),

            /* Spacing */
            50.h,

            /* Heading */
            Center(
              child: Text(
                'Welcome Back',
                style: TextStyle().heading26Blue,
                textAlign: TextAlign.center,
              ),
            ),

            /* Subheading */
            6.h,
            Center(
              child: Text(
                'Sign in to continue your journey',
                style: TextStyle().subHeadingBlack,
                textAlign: TextAlign.center,
              ),
            ),

            /* Input Section */
            50.h,
            Text('Email', style: TextStyle().bodySmall14),

            /* Spacing */
            8.h,

            /* Email Input Field */
            editTextField(
              textController: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              hint: 'Enter your email',
              borderColor: AuthColors.borderColor,
              textColor: AuthColors.defaultTextColor,
              error: () => print("Email field is empty"),
            ),

            /* Spacing */
            24.h,

            /* Password Label */
            Text('Password', style: TextStyle().bodySmall14),

            /* Spacing */
            8.h,

            /* Password Input Field */
            PasswordTextField(
              textController: passwordController,
              hint: "Enter your password",
              textColor: AuthColors.defaultTextColor,
              borderColor: AuthColors.borderColor,
              iconColor: AuthColors.defaultTextColor,
              error: () => print("Password field is empty"),
            ),

            /* Spacing */
            25.h,

            /* Forgot Password Button */
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ResetPasswordScreen())
                  )
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle().bodySmall12.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AuthColors.geryTextColor,
                    decorationThickness: 1.5,
                  ),
                ),
              ),
            ),

            /* Spacing */
            24.h,

            /* Login Button */
            showCustomButton(
              context: context,
              text: 'Log In',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              ),
              bgColor: AuthColors.defaultButtonColor,
              borderRadius: 5,
            ),

            /* Bottom Spacing */
            30.h,
          ],
        ),
      ),
    );
  }
}
