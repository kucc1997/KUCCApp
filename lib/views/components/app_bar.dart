import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kucc_app/views/pages/profile/profile.dart';
import 'package:kucc_app/views/pages/signup_login/components/logo.dart';

//color: Color(0xFF46406B),
class KUCCAppBar extends HookWidget {
  const KUCCAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(18),
              bottomRight: const Radius.circular(18)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 10),
              blurRadius: 8,
            )
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const KUCCAppBarProfileButton(),
        const KUCCAppBarProfileButton()
      ]),
    );
  }
}

class KUCCAppBarProfileButton extends HookWidget {
  const KUCCAppBarProfileButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8, top: 30),
      child: Material(
        shape: const CircleBorder(),
        color: Colors.white,
        child: InkWell(
          //color : Colors.white,
          customBorder: const CircleBorder(),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(14.0),
            child: Icon(Icons.person_outline),
          ),
        ),
      ),
    );
  }
}

//class KUCCAppBarNotification extends HookWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    throw UnimplementedError();
//  }
//}

class KUCCAppBarLogo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 32),
        child: Row(
          children: [
            Logo(height: 44, width: 45),
            Text(
              "KUCC",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            )
          ],
        ));
  }
}
