import 'package:authentication/src/view/widgets/button_widget.dart';
import 'package:authentication/theme/color/auth_colors.dart';
import 'package:authentication/theme/extensions/style_extensions.dart';
import 'package:flutter/material.dart';

import '../../widgets/edit_text_field_widget.dart';
import 'AppIntroScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController fullNameController;

  late final TextEditingController emailController;

  late final TextEditingController passwordController;

  late final TextEditingController confirmPasswordController;

  String _password = '';
  bool isPasswordMatched = false;

  @override
  void initState() {
    super.initState();

    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    passwordController.addListener(() {
      final value = passwordController.text.trim();
      if (value != _password) {
        setState(() {
          _password = value;
        });
      }
    });

    confirmPasswordController.addListener(() {
      final value = confirmPasswordController.text.trim();
      setState(() {
        isPasswordMatched = value == _password;
        debugPrint(
          "Debug: Confirm password entered = $value, isPasswordMatched = $isPasswordMatched",
        );
      });
    });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  /*Validation regex*/
  bool get _hasMinLen => _password.length >= 8;

  bool get _hasUpper => RegExp(r'[A-Z]').hasMatch(_password);

  bool get _hasLower => RegExp(r'[a-z]').hasMatch(_password);

  bool get _hasNumber => RegExp(r'[0-9]').hasMatch(_password);

  bool get _hasSpecial =>
      RegExp(r"[!@#\$%^&*(),.?':{}|<>_\-\/\\\[\];`~+=]").hasMatch(_password);

  /*Creating a row for password validation*/
  _criteriaRow(bool ok, String text) => Row(
    children: [
      CircleAvatar(
        radius: 8,
        backgroundColor: ok ? AuthColors.validationPasswordColor : Colors.grey,
        child: const Icon(Icons.check_rounded, size: 12, color: Colors.white),
      ),
      8.w,
      Text(text, style: TextStyle().bodySmall14),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AuthColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*Top Spacing*/
              20.h,

              /*Back btn*/
              showAppBarBackBtn(
                context: context,
                backBtnListener: () => Navigator.pop(context),
              ),

              /*Heading*/
              50.h,
              Center(
                child: Text(
                  'Your Safe Space',
                  style: TextStyle().heading26Blue,
                  textAlign: TextAlign.center,
                ),
              ),

              /*SubHeading*/
              8.h,
              Center(
                child: Text(
                  'Create your account to begin your journey of healing and empowerment',
                  style: TextStyle().subHeadingBlack,
                  textAlign: TextAlign.center,
                ),
              ),

              /*Input Section*/
              56.h,

              /*Full Name Label*/
              Text('Full Name', style: TextStyle().bodySmall14),

              /*FullName Input Field*/
              8.h,
              editTextField(
                textController: fullNameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                hint: 'Enter your full name',
                borderColor: AuthColors.borderColor,
                textColor: AuthColors.defaultTextColor,
                error: () => print("Full Name field is empty"),
              ),

              /*Email Label*/
              20.h,
              Text('Email', style: TextStyle().bodySmall14),

              /* Email Input Field */
              8.h,
              editTextField(
                textController: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                hint: 'Enter your email address',
                borderColor: AuthColors.borderColor,
                textColor: AuthColors.defaultTextColor,
                error: () => print("Email field is empty"),
              ),

              /* Password Label */
              20.h,
              Text('Password', style: TextStyle().bodySmall14),

              /* Password Input Field */
              8.h,
              PasswordTextField(
                textController: passwordController,
                hint: "Create a password",
                textColor: AuthColors.defaultTextColor,
                borderColor: AuthColors.borderColor,
                iconColor: AuthColors.defaultTextColor,
                error: () => print("Password field is empty"),
              ),

              /* Password Validation Checklist */
              12.h,
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

              /*Confirm Password Label*/
              20.h,
              Text('Confirm Password', style: TextStyle().bodySmall14),

              /*Confirm Password Input Field*/
              8.h,
              PasswordTextField(
                textController: passwordController,
                hint: "Create a password",
                textColor: AuthColors.defaultTextColor,
                borderColor: AuthColors.borderColor,
                iconColor: AuthColors.defaultTextColor,
                error: () => print("Password field is empty"),
              ),

              /*Sign up btn*/
              32.h,
              showCustomButton(
                context: context,
                text: "Create Account",
                bgColor: AuthColors.defaultButtonColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AppIntroScreen())
                  );
                },
              ) ,

              /*Bottom Spacing*/
              39.h,
            ],
          ),
        ),
      ),
    );
  }
}