import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kucc_app/constants/image_path.dart';
import 'package:kucc_app/constants/sizes.dart';
import 'package:kucc_app/constants/text_strings.dart';
import 'package:kucc_app/views/pages/profile/update_profile.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _profilePic;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _profilePic = img;
    });
  }

  final Category = ["Certificates", "Saved Events", "Get Membership"];
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
                    child: const Image(image: AssetImage(kuccLogo)),
                  ),
                ),
                if (_profilePic != null)
                  Image.memory(
                    _profilePic!,
                    width: 120,
                    height: 120,
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
                      child: IconButton(
                        icon: const Icon(
                          LineAwesomeIcons.alternate_pencil,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {
                          selectImage();
                        },
                      )),
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
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    tEdit,
                    style: TextStyle(color: Colors.amber),
                  )),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            //Menu
            ProfileMenuWidget(),
            ProfileMenuWidget(),
            ProfileMenuWidget(),
          ]),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: const Icon(
          LineAwesomeIcons.certificate,
          color: Colors.black,
        ),
      ),
      title: Text(
        "Certificates",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: const Icon(
          LineAwesomeIcons.angle_right,
          size: 18.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}
