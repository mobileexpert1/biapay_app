import 'dart:async';
import 'dart:io';

import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:logger/logger.dart';

class PdfViewPage extends StatefulWidget {
  final File? pdfFile;
  const PdfViewPage({Key? key, required this.pdfFile}) : super(key: key);

  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  BiaAppBar(),
      body: PDFView(
        filePath: widget.pdfFile!.path,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onRender: (_pages) {
          setState(() {
            pages = _pages;
            isReady = true;
          });
        },
        onError: (error) {
          Logger().e(error.toString());
        },
        onPageError: (page, error) {
          Logger().e('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController pdfViewController) {
          _controller.complete(pdfViewController);
        },
        onPageChanged: (int? page, int? total) {
          Logger().i('page change: $page/$total');
        },
      ),
    );
  }
}
