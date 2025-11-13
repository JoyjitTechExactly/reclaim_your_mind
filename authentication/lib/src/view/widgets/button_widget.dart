import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../theme/color/auth_colors.dart';

/*Back btn*/
Widget showAppBarBackBtn({required BuildContext context, required VoidCallback backBtnListener}) {
  return IconButton(
    onPressed: backBtnListener,
    // removes default 48x48 padding
    icon: SvgPicture.asset('assets/icons/ic_back.svg', width: 36, height: 36),
    padding: EdgeInsets.zero,
    alignment: Alignment.centerLeft,
  );
}

/*Common Custom btn*/
Widget showCustomButton({
  required BuildContext context,
  required VoidCallback onPressed,
  required String text,
  double textSize = 18,
  Color textColor = Colors.white,
  Color bgColor = AuthColors.defaultButtonColor,
  double borderRadius = 8,
  double height = 50,
}) {
  return SizedBox(
    width: double.infinity,
    height: height,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: textSize, color: textColor),
      ),
    ),
  );
}
