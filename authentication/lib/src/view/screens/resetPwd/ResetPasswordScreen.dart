import 'package:authentication/src/view/widgets/button_widget.dart';
import 'package:authentication/theme/color/auth_colors.dart';
import 'package:authentication/theme/extensions/style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/edit_text_field_widget.dart';
import 'OtpVerifyScreen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
      backgroundColor: AuthColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* Top Spacing */
              20.h,

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
                  'Reset Password',
                  style: TextStyle().heading26Blue,
                  textAlign: TextAlign.center,
                ),
              ),

              /* Subheading */
              6.h,
              Center(
                child: Text(
                  'Enter your email or phone number\nto reset your password',
                  style: TextStyle().subHeadingBlack,
                  textAlign: TextAlign.center,
                ),
              ),

              /* Input Section */
              50.h,
              Text('Email', style: TextStyle().bodySmall14),

              /* Spacing */
              8.h,

              /* Email Field */
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

              /* Send Reset Code Button */
              showCustomButton(
                context: context,
                text: 'Send Reset Code',
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const OtpVerifyScreen()),
                  ),
                },
                bgColor: AuthColors.defaultButtonColor,
                borderRadius: 5,
              ),

              /* Spacing */
              42.h,

              /* Footer Information Box */
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AuthColors.borderColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(17),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ic_info.svg',
                      height: 18,
                      width: 18,
                    ),
                    9.w,
                    Expanded(
                      child: Text(
                        "We'll send you a 6-digit verification code to reset your password securely.",
                        style: TextStyle().bodySmall14,
                      ),
                    ),
                  ],
                ),
              ),

              /* Bottom Spacing */
              39.h,
            ],
          ),
        ),
      ),
    );
  }
}
