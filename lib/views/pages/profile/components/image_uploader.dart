import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kucc_app/constants/image_path.dart';
import 'dart:typed_data';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ImageUploader extends StatefulWidget {
  final void Function(Uint8List? image) onImageSelected;

  ImageUploader({required this.onImageSelected, Key? key}) : super(key: key);

  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  Uint8List? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            if (_selectedImage != null)
              CircleAvatar(
                radius: 64,
                backgroundImage: MemoryImage(_selectedImage!),
              )
            else
              const CircleAvatar(
                radius: 64,
                backgroundImage: AssetImage(profile),
                backgroundColor: Colors.transparent,
              ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      LineAwesomeIcons.alternate_pencil,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: _pickImage,
                  )),
            )
          ],
        ),
      ],

      // crossAxisAlignment: CrossAxisAlignment.stretch,
      // children: [
      //   if (_selectedImage != null)
      //     Image.memory(
      //       _selectedImage!,
      //       fit: BoxFit.cover,
      //       height: 200, // Adjust height as needed
      //     ),
      //   ElevatedButton(
      //     onPressed: _pickImage,
      //     child: Text('Select Image'),
      //   ),
      // ],
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      Uint8List? imageData = await pickedImage.readAsBytes();
      setState(() {
        _selectedImage = imageData;
      });
      widget.onImageSelected(_selectedImage);
    }
  }
}
