import 'package:authentication/src/view/screens/resetPwd/ResetPwdSuccessScreen.dart';
import 'package:authentication/src/view/widgets/button_widget.dart';
import 'package:authentication/theme/color/auth_colors.dart';
import 'package:authentication/theme/extensions/style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/edit_text_field_widget.dart';
import 'OtpVerifyScreen.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  String _password = '';

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordController.addListener(() {
      final v = passwordController.text;
      if (v != _password) {
        setState(() {
          _password = v;
        });
      }
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool get _hasMinLen => _password.length >= 8;

  bool get _hasUpper => RegExp(r'[A-Z]').hasMatch(_password);

  bool get _hasLower => RegExp(r'[a-z]').hasMatch(_password);

  bool get _hasNumber => RegExp(r'[0-9]').hasMatch(_password);

  bool get _hasSpecial =>
      RegExp(r"[!@#\$%^&*(),.?':{}|<>_\-\/\\\[\];`~+=]").hasMatch(_password);

  Widget _criteriaRow(bool ok, String text) {
    return Row(
      children: [
        CircleAvatar(
          radius: 8,
          backgroundColor: ok ? AuthColors.validationPasswordColor : Colors.grey,
          child: const Icon(Icons.check, size: 10, color: Colors.white),
        ),
        8.w,
        Text(text, style: TextStyle().bodySmall14),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                'Set New Password',
                style: TextStyle().heading26Blue,
                textAlign: TextAlign.center,
              ),
            ),

            /* Subheading */
            6.h,
            Center(
              child: Text(
                'Create a secure password for your account',
                style: TextStyle().subHeadingBlack,
                textAlign: TextAlign.center,
              ),
            ),

            /* Input Section */
            50.h,
            /* Password Label */
            Text('Password', style: TextStyle().bodySmall14),

            /* Spacing */
            8.h,

            /* Password Input Field */
            PasswordTextField(
              textController: passwordController,
              hint: "Create a password",
              textColor: AuthColors.defaultTextColor,
              borderColor: AuthColors.borderColor,
              iconColor: AuthColors.defaultTextColor,
              error: () => print("Password field is empty"),
            ),

            /*Spacing*/
            18.h,
            /*Confirm Password Label */
            Text('Confirm Password', style: TextStyle().bodySmall14),

            /* Spacing */
            8.h,

            /*Confirm Password Input Field */
            PasswordTextField(
              textController: confirmPasswordController,
              hint: "Create a password",
              textColor: AuthColors.defaultTextColor,
              iconColor: AuthColors.defaultTextColor,
              borderColor: AuthColors.borderColor,
              error: () => print("Confirm Password field is empty"),
            ),

            /* Spacing */
            16.h,

            /* Password Validation Checklist */
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _criteriaRow(_hasMinLen, 'At least 8 characters'),
                8.h,
                _criteriaRow(_hasUpper, 'One uppercase letter'),
                8.h,
                _criteriaRow(_hasLower, 'One lowercase letter'),
                8.h,
                _criteriaRow(_hasNumber, 'One number'),
                8.h,
                _criteriaRow(_hasSpecial, 'One special character'),
              ],
            ),
            /* Spacing */
            24.h,

            /* Save New Password Button */
            showCustomButton(
              context: context,
              text: 'Save New Password',
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ResetPwdSuccessScreen()),
                ),
              },
              bgColor: AuthColors.defaultButtonColor,
              borderRadius: 5,
            ),

            /* Bottom Spacing */
            39.h,
          ],
        ),
      ),
    );
  }
}
