import 'dart:async';
import 'package:authentication/src/view/screens/resetPwd/SetNewPasswordScreen.dart';
import 'package:authentication/src/view/widgets/button_widget.dart';
import 'package:authentication/theme/color/auth_colors.dart';
import 'package:authentication/theme/extensions/style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final int _otpLength = 6;
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _nodes;
  Timer? _timer;
  int _secondsRemaining = 45;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(_otpLength, (_) => TextEditingController());
    _nodes = List.generate(_otpLength, (_) => FocusNode());
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = 45;
    _canResend = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsRemaining <= 1) {
        t.cancel();
        setState(() => _canResend = true);
      } else {
        setState(() => _secondsRemaining--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final c in _controllers) c.dispose();
    for (final n in _nodes) n.dispose();
    super.dispose();
  }

  String get _code => _controllers.map((c) => c.text).join();

  void _onVerify() {
    // TODO: integrate verification logic
    debugPrint('Verifying code: $_code');
  }

  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 48,
      height: 56,
      child: TextField(
        controller: _controllers[index],
        focusNode: _nodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle().heading26Blue,
        maxLength: 1,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AuthColors.borderColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AuthColors.borderColor, width: 2.5),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (val) {
          if (val.isNotEmpty) {
            if (index + 1 < _otpLength) {
              _nodes[index + 1].requestFocus();
            } else {
              _nodes[index].unfocus();
            }
          } else {
            if (index - 1 >= 0) _nodes[index - 1].requestFocus();
          }
          setState(() {});
        },
      ),
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
                'Verify Your Account',
                style: TextStyle().heading26Blue,
                textAlign: TextAlign.center,
              ),
            ),

            /* Subheading */
            6.h,
            Center(
              child: Text(
                "We've sent a 6-digit verification code to your email. Please enter it below to continue.",
                style: TextStyle().subHeadingBlack,
                textAlign: TextAlign.center,
              ),
            ),

            /* Spacing After Back Button */
            50.h,

            /* OTP Boxes */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_otpLength, _buildOtpBox),
            ),

            /* Spacing before Verify */
            24.h,

            /* Verify Button */
            showCustomButton(
              context: context,
              text: 'Verify Code',
              onPressed: () {
                _code.length == _otpLength ? _onVerify : null;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SetNewPasswordScreen()),
                );
              },
              bgColor: AuthColors.defaultButtonColor,
              borderRadius: 5,
            ),

            /* Spacing before Resend */
            24.h,

            /* Resend Container */
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AuthColors.borderColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Didn't receive the code?",
                      style: TextStyle().bodySmall12,
                    ),
                    6.h,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _canResend
                              ? () {
                                  for (final c in _controllers) c.clear();
                                  _startTimer();
                                }
                              : null,
                          child: Text(
                            'Resend code',
                            style: TextStyle().bodySmall12.copyWith(
                              color: AuthColors.defaultButtonColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Text('  in  ', style: TextStyle().bodySmall12),
                        Text(
                          _canResend
                              ? '0:00'
                              : '0:${_secondsRemaining.toString().padLeft(2, '0')}',
                          style: TextStyle().bodySmall12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /* Bottom Spacing */
            30.h,
          ],
        ),
      ),
    );
  }
}
