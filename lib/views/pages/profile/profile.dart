import 'package:flutter/material.dart';
import 'package:kucc_app/constants/sizes.dart';
import 'package:kucc_app/constants/text_strings.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(tSize),
          child: Column(children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(image: AssetImage("")),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.yellow,
                    ),
                    child: const Icon(
                      LineAwesomeIcons.alternate_pencil,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              tProfileHeading,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(tProfileSubheading,
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10,)
          ]),
        ),
      ),
    );
  }
}
