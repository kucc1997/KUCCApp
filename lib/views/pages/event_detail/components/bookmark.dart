import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BookMark extends HookWidget {
  const BookMark({super.key});

  @override
  Widget build(BuildContext context) {
    final _value = useState(false);

    return InkWell(
      onTap: () {
        _value.value = !_value.value;
      },
      child: Icon(
        _value.value ? Icons.bookmark : Icons.bookmark_border_outlined,
        size: 40,
        color: Color.fromARGB(255, 0, 57, 103),
      ),
    );
  }
}
