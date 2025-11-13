import 'package:authentication/src/view/widgets/button_widget.dart';
import 'package:authentication/theme/extensions/style_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../theme/color/auth_colors.dart';
import 'ProfileSuccessScreen.dart';

class AppIntroScreen extends StatefulWidget {
  const AppIntroScreen({super.key});

  @override
  State<StatefulWidget> createState() => AppIntroState();
}

class AppIntroState extends State<AppIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AuthColors.backgroundLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /**Top View*/
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  /*Top image*/
                  const Image(
                    width: double.infinity,
                    height: double.infinity,
                    image: AssetImage('assets/images/bg_app_intro.png'),
                    fit: BoxFit.fill,
                  ),

                  /*Back btn*/
                  Positioned(
                    top: 40,
                    left: 16,
                    child: showAppBarBackBtn(
                      context: context,
                      backBtnListener: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),

            /**Bottom View*/
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  33.h,
                  /* Heading */
                  Center(
                    child: Text(
                      'Your Empowerment Journey',
                      style: TextStyle().heading26Blue,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  /* Subheading */
                  12.h,
                  Center(
                    child: Text(
                      "This app empowers you to identify emotional abuse, process the resulting feelings, and learn effective coping strategies. Move at your own pace through our four phases of healing.",
                      style: TextStyle().bodySmall14.copyWith(
                        color: AuthColors.geryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  /*Steps*/
                  41.h,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildStepItem(
                        icon: Icons.remove_red_eye_outlined,
                        title: 'Awareness',
                        description:
                            'Recognize patterns and how relationships are maintained',
                        isLast: false,
                      ),
                      buildStepItem(
                        icon: Icons.favorite_border,
                        title: 'Acceptance',
                        description:
                            'Transition intense emotions to a place of calm clarity',
                        isLast: false,
                      ),
                      buildStepItem(
                        icon: Icons.spa_outlined,
                        title: 'Appreciation',
                        description:
                            'Develop a balanced perspective of the relationship',
                        isLast: false,
                      ),
                      buildStepItem(
                        icon: Icons.bolt_outlined,
                        title: 'Action',
                        description:
                            'Learn coping skills to reclaim your inner peace and reaction pattern',
                        isLast: true,
                      ),
                    ],
                  ),

                  /*Start journey button*/
                  56.h,
                  showCustomButton(
                    context: context,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProfileSuccessScreen(),
                        ),
                      );
                    },
                    text: "Start My Journey",
                    bgColor: AuthColors.defaultButtonColor,
                  ),

                  /*Footer text*/
                  22.h,
                  Text(
                    "You decide the pace. Nothing here is rushed.",
                    style: TextStyle().bodySmall14.copyWith(
                      color: AuthColors.geryTextColor,
                    ),
                  ),

                  /*Bottom spacing*/
                  39.h,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStepItem({
    required IconData icon,
    required String title,
    required String description,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*Left: icon + connector*/
        Column(
          children: [
            /*Circle icon*/
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AuthColors.defaultButtonColor, size: 24),
            ),

            // Connector line (hide for last item)
            if (!isLast)
              Container(
                width: 2,
                height: 32,
                color: Colors.blue.withOpacity(0.3),
              ),
          ],
        ),

        /*Spacing*/
        15.w,

        /*Right: text section*/
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle().subHeadingBlue),
              4.h,
              Text(description, style: const TextStyle().bodySmall14),
              20.h,
            ],
          ),
        ),
      ],
    );
  }
}
