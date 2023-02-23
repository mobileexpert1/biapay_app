import 'dart:io';

import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewerScreen extends StatelessWidget {
  final File? image;
  const PhotoViewerScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  BiaAppBar(),
      body: PhotoView(
        imageProvider: FileImage(image!),
      ),
    );
  }
}
