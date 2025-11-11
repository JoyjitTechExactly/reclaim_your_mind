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

/*Edit text field*/
Widget editTextField({
  required TextEditingController textController,
  required TextInputType keyboardType,
  required TextInputAction textInputAction,
  String hint = "Enter here...",
  double textSize = 16,
  Color hintColor = Colors.grey,
  Color textColor = Colors.black,
  Color borderColor = Colors.grey,
  double borderRadius = 8,
  required VoidCallback error,
}) {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: BorderSide(color: borderColor, width: 1.5),
  );

  return TextField(
    controller: textController,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    style: TextStyle(color: textColor, fontSize: textSize),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: hintColor, fontSize: textSize),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      errorStyle: TextStyle(
        color: Colors.red,
        fontSize: textSize * 0.9,
        fontWeight: FontWeight.w600,
      ),
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(color: borderColor.withOpacity(0.8), width: 2),
      ),
      errorBorder: border.copyWith(
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: border.copyWith(
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    ),
    onChanged: (value) {
      if (value.isEmpty) {
        error();
      }
    },
  );
}

/*Password text field with show/hide toggle*/
class PasswordTextField extends StatefulWidget {
  final TextEditingController textController;
  final String hint;
  final double textSize;
  final Color hintColor;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final Color iconColor;
  final VoidCallback error;

  const PasswordTextField({
    super.key,
    required this.textController,
    this.hint = "Enter password...",
    this.textSize = 16,
    this.hintColor = Colors.grey,
    this.textColor = Colors.black,
    this.borderColor = Colors.grey,
    this.borderRadius = 8,
    this.iconColor = Colors.grey,
    required this.error,
  });

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(color: widget.borderColor, width: 1.5),
    );

    return TextField(
      controller: widget.textController,
      obscureText: _isObscured,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      style: TextStyle(color: widget.textColor, fontSize: widget.textSize),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: widget.hintColor,
          fontSize: widget.textSize,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: widget.textSize * 0.9,
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(
            color: widget.borderColor.withOpacity(0.8),
            width: 2,
          ),
        ),
        errorBorder: border.copyWith(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscured ? Icons.visibility : Icons.visibility_off,
            color: widget.iconColor,
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
      ),
      onChanged: (value) {
        if (value.isEmpty) widget.error();
      },
    );
  }
}

/*Common Custom btn */
Widget showCustomButton({
  required BuildContext context,
  required VoidCallback onPressed,
  required String text,
  double textSize = 16,
  Color textColor = Colors.white,
  Color bgColor = AuthColors.defaultButtonColor,
  double borderRadius = 12,
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
