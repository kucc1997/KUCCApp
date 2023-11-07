import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kucc_app/constants/constants.dart';
import 'package:kucc_app/constants/sizes.dart';
import 'package:kucc_app/constants/text_strings.dart';
import 'package:kucc_app/viewmodels/profile_page_viewmodel.dart';
import 'package:kucc_app/views/components/app_bar.dart';
import 'package:kucc_app/views/pages/profile/components/image_uploader.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _profilePic;
  final List<String> items = [
    'Certificates',
    'Saved Events',
    'Get Membership',
    
  ];

  late ProfilePageViewModel viewModel;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = Provider.of<ProfilePageViewModel>(context);
  }

  @override
  // Access the view model from the context

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            KUCCAppBar(),
            const SizedBox(
              height: 10,
            ),
            ImageUploader(
              onImageSelected: (image) {
                setState(() {
                  _profilePic = image;
                });
              },
            ),

            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<ProfilePageViewModel>(
                  builder: (context, viewModel, child) {
                    return Text(
                      '${viewModel.userName}',
                      style: TextStyle(
                          fontSize: FontSizes.heading,
                          fontFamily: Fonts.heading,
                          color: Palette.primaryColor,
                          fontWeight: FontWeights.bold),
                    );
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<ProfilePageViewModel>(
                  builder: (context, viewModel, child) {
                    return Text(
                      '${viewModel.fieldofStudy}',
                      style: Theme.of(context).textTheme.bodySmall,
                      
                    );
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" Year ",
                        style: Theme.of(context).textTheme.bodySmall),
                    Consumer<ProfilePageViewModel>(
                      builder: (context, viewModel, child) {
                        return Text(
                          '${viewModel.academicYear}',
                          style: Theme.of(context).textTheme.bodySmall,
                        );
                      },
                    ),
                    Text(
                      " Semester ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Consumer<ProfilePageViewModel>(
                      builder: (context, viewModel, child) {
                        return Text(
                          '${viewModel.academicSemester}',
                          style: Theme.of(context).textTheme.bodySmall,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    tEdit,
                    style: TextStyle(color: Colors.white),
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
        style: Theme.of(context).textTheme.bodySmall,
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
