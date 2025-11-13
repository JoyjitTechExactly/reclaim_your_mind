import 'package:authentication/src/view/screens/auth/SignInScreen.dart';
import 'package:authentication/src/view/widgets/button_widget.dart';
import 'package:authentication/theme/color/auth_colors.dart';
import 'package:authentication/theme/extensions/style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSuccessScreen extends StatelessWidget {
  const ProfileSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AuthColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Top spacing*/
              120.h,

              /** Success Image*/
              SvgPicture.asset(
                "assets/icons/ic_profile_success.svg",
                height: 72,
                width: 72,
              ),

              /*Heading section*/
              28.h,
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    /* Heading */
                    Text(
                      'A Final Step Before We Get Started',
                      style: TextStyle().heading26Blue,
                      textAlign: TextAlign.center,
                    ),

                    /* Subheading */
                    12.h,
                    Text(
                      'This is an educational space to better understand emotionally abusive behaviors and to learn more effective coping strategies.',
                      style: TextStyle().subHeadingBlack,
                      textAlign: TextAlign.center,
                    ),

                    /*Divider*/
                    20.h,
                    Divider(color: AuthColors.blueTextColor, thickness: 1),
                  ],
                ),
              ),

              /*Note*/
              Text(
                'If you are in crisis or need immediate help, please reach out to a trusted professional or local hotline.',
                style: TextStyle().bodySmall14.copyWith(
                  color: AuthColors.geryTextColor,
                ),
                textAlign: TextAlign.center,
              ),

              /*Bottom Button section*/
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      'Your healing journey begins at your own pace.',
                      style: TextStyle().bodySmall12.copyWith(
                        color: AuthColors.geryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
