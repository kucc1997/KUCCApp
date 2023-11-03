// TODO : Use color from the themeprovider

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kucc_app/models/model/routine_data.dart';
import 'package:kucc_app/viewmodels/routine_viewmodel.dart';
import 'package:kucc_app/views/components/app_bar.dart';
import 'package:kucc_app/views/pages/event_detail/components/event_button.dart';
import 'package:kucc_app/views/pages/routine/components/routine_timeline.dart';
import 'package:kucc_app/views/pages/routine/components/routine_week_slider.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:timelines/timelines.dart';

class RoutineFacultyBatchButton extends HookWidget {
  final void Function() onClick;

  const RoutineFacultyBatchButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(milliseconds: 80));
    final animation = useAnimation(controller);
    final isButtonActive = useState(false);
    final themeData = Theme.of(context);

    void onTap() {
      isButtonActive.value = !isButtonActive.value;
      onClick();
      if (isButtonActive.value) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: isButtonActive.value
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.onPrimary,
            ),
            width: double.infinity,
            height: 56,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "CS - 2021",
                  style: GoogleFonts.manrope(
                      color: isButtonActive.value
                          ? themeData.colorScheme.onPrimary
                          : themeData.colorScheme.primary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.002) // Perspective effect
                        ..rotateX(animation * 3.14), // Rotate on the X-axis
                      child: Icon(Icons.keyboard_arrow_down,
                          size: 26,
                          color: isButtonActive.value
                              ? themeData.colorScheme.onPrimary
                              : themeData.colorScheme.primary),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
