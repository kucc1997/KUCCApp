import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends HookWidget {
  final String buttonText;
  final IconData? startingIcon;

  const Button({super.key, required this.buttonText, this.startingIcon});

  @override
  Widget build(BuildContext context) {
    final _value = useState(false);

    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.75,
      child: OutlinedButton(
        onPressed: () {
          _value.value = !_value.value;
        },
        style: OutlinedButton.styleFrom(
          backgroundColor:
              _value.value ? Color.fromARGB(255, 0, 57, 103) : Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.5)),
          side: BorderSide(
              color: _value.value
                  ? Color.fromARGB(255, 0, 57, 103)
                  : Color.fromARGB(131, 19, 19, 19)),
        ),
        child: Center(
            child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              startingIcon,
              color:
                  _value.value ? Colors.white : Color.fromARGB(131, 19, 19, 19),
              size: 18,
            ),
            SizedBox(width: 8),
            Text(
              buttonText,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: _value.value
                    ? Colors.white
                    : Color.fromARGB(131, 19, 19, 19),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
