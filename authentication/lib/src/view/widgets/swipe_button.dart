import 'package:authentication/theme/extensions/style_extensions.dart';
import 'package:flutter/material.dart';

import '../../../theme/color/auth_colors.dart';

class SwipeButton extends StatefulWidget {
  final double pathHeight;
  final double pathWidth;
  final double btnWidth;
  final double btnHeight;
  final Function onSwipeComplete;
  final String text;
  final Color btnColor;
  final Color textColor;
  final Color pathColor;
  final Color boarderColor;

  const SwipeButton({
    super.key,
    required this.onSwipeComplete,
    this.text = "Swipe -->",
    this.pathHeight = 56,
    this.pathWidth = double.infinity,
    this.btnColor = AuthColors.defaultButtonColor,
    this.textColor = AuthColors.blueTextColor,
    this.pathColor = Colors.white,
    this.boarderColor = AuthColors.borderColor,
    this.btnHeight = 48,
    this.btnWidth = 48,
  });

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  double dragPosition = 0;
  bool hideText = false;

  @override
  Widget build(BuildContext context) {
    double maxDrag = widget.pathWidth - widget.pathHeight;

    return Container(
      width: widget.pathWidth,
      height: widget.pathHeight,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: widget.pathColor,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: widget.boarderColor,
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          // CENTER TEXT (HIDE DURING DRAG)
          Center(
            child: AnimatedOpacity(
              opacity: hideText ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 150),
              child: Text(
                widget.text,
                style: TextStyle().bodyBlue.copyWith(
                  color: widget.textColor,
                ),
              ),
            ),
          ),

          // DRAGGABLE CIRCLE
          Positioned(
            left: dragPosition,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onHorizontalDragStart: (_) {
                setState(() => hideText = true);
              },
              onHorizontalDragUpdate: (details) {
                setState(() {
                  dragPosition += details.delta.dx;
                  if (dragPosition < 0) dragPosition = 0;
                  if (dragPosition > maxDrag) dragPosition = maxDrag;
                });
              },
              onHorizontalDragEnd: (_) {
                if (dragPosition > maxDrag * 0.9) {
                  widget.onSwipeComplete();
                }

                // RESET
                setState(() {
                  dragPosition = 0;
                  hideText = false;
                });
              },
              child: Container(
                width: widget.btnWidth,
                height: widget.btnHeight,
                decoration: BoxDecoration(
                  color: widget.btnColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_forward_rounded, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
