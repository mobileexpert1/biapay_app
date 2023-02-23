import 'package:flutter/material.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  final Function(bool) ontap;
  const ImagePickerBottomSheet({Key? key, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: <Widget>[
          ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Photo Library'),
              onTap: () {
                ontap(false);
                Navigator.of(context).pop();
              }),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: const Text('Camera'),
            onTap: () {
              ontap(true);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
