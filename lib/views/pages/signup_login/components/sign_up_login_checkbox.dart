import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LSCheckbox extends HookWidget {
  final bool value;
  final Function(bool) onChange;
  final Widget trailingWidget;

  const LSCheckbox({super.key, required this.value, required this.onChange, required this.trailingWidget});

  @override
  Widget build(BuildContext context) {
    final current = useState(value);

    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), border: Border.all(color: Color(0xFFCDD1E0), width: 2)),
          child: SizedBox(
            height: 18.0,
            width: 18.0,
            child: Checkbox(
              side: const BorderSide(color: Colors.transparent),
              value: current.value,
              onChanged: (v) {
                current.value = v!;
                onChange(v);
              },
              checkColor: const Color(0xFF000C14),
              activeColor: Colors.transparent,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 8),
          child: trailingWidget,
        )
      ],
    );
  }
}
