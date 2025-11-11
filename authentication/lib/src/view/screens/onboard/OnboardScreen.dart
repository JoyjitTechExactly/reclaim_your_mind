import 'package:authentication/theme/extensions/style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:authentication/theme/color/auth_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:authentication/src/view/screens/auth/SignInScreen.dart';
import 'package:authentication/src/view/screens/auth/SignUpScreen.dart';

import '../../widgets/common_ui_ext.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AuthColors.backgroundLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /** Top view */
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: AuthColors.backgroundDark),
              child: const Image(
                image: AssetImage('assets/images/rym_logo.png'),
                height: 188,
                width: 165,
                fit: BoxFit.contain,
              ),
            ),

            /** Bottom View */
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AuthColors.backgroundLight,
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*Heading*/
                  Text(
                    'Reclaim Your Mind',
                    style: const TextStyle().heading32Blue,
                  ),
                  /*Sub Heading 1*/
                  Text(
                    'Awareness. Healing. Empowerment.',
                    style: const TextStyle().subHeadingBlack,
                  ),
                  /*Sub Heading 2*/
                  10.h,
                  Text(
                    'A safe space for healing, reflection, \n and growth — always at your own pace.',
                    style: const TextStyle().bodyBlack,
                    textAlign: TextAlign.center,
                  ),
                  /*Spacing*/
                  37.h,
                  /*Create new account Button*/
                  showCustomButton(
                    context: context,
                    text: 'Create New Account',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignUpScreen()),
                      );
                    },
                    bgColor: AuthColors.defaultButtonColor,
                    borderRadius: 5
                  ),
                  /*Spacing*/
                  20.h,
                  /*Already have account section*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: const TextStyle().bodyBlack,
                      ),
                      const SizedBox(width: 9),
                      /*Login Btn*/
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const SignInScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          backgroundColor: AuthColors.secondaryButonColor,
                          foregroundColor: AuthColors.defaultButtonColor,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Text('Log In', style: TextStyle().bodyBlue),
                      ),
                    ],
                  ),
                  /*Spacing*/
                  59.h,
                  /*Footer section*/
                  Container(
                    width: 288.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: AuthColors.borderColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(17),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_privacy.svg',
                          height: 24,
                          width: 24,
                        ),
                        9.w,
                        Expanded(
                          child: Text(
                            'Your privacy and safety are our priority. All data is encrypted and secure.',
                            style: TextStyle().bodySmall12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*Spacing*/
                  39.h,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
