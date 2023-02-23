import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const PdfColor green = PdfColor.fromInt(0xffe06c6c); //darker background color
const PdfColor lightGreen =
    PdfColor.fromInt(0xffedabab); //light background color

const _darkColor = PdfColor.fromInt(0xff242424);
// const _lightColor = PdfColor.fromInt(0xff9D9D9D);
const PdfColor baseColor = PdfColor.fromInt(0xffD32D2D);
const PdfColor _baseTextColor = PdfColor.fromInt(0xffffffff);
const PdfColor accentColor = PdfColor.fromInt(0xfff1c0c0);

Future<PageTheme> _myPageTheme(PdfPageFormat format) async {
  return PageTheme(
    pageFormat: format.applyMargin(
        left: 2.0 * PdfPageFormat.cm,
        top: 4.0 * PdfPageFormat.cm,
        right: 2.0 * PdfPageFormat.cm,
        bottom: 2.0 * PdfPageFormat.cm),
    theme: ThemeData.withFont(),
    buildBackground: (Context context) {
      return FullPage(
        ignoreMargins: true,
        child: CustomPaint(
          size: PdfPoint(format.width, format.height),
          painter: (PdfGraphics canvas, PdfPoint size) {
            context.canvas
              ..setColor(lightGreen)
              ..moveTo(0, size.y)
              ..lineTo(0, size.y - 230)
              ..lineTo(60, size.y)
              ..fillPath()
              ..setColor(green)
              ..moveTo(0, size.y)
              ..lineTo(0, size.y - 100)
              ..lineTo(100, size.y)
              ..fillPath()
              ..setColor(lightGreen)
              ..moveTo(30, size.y)
              ..lineTo(110, size.y - 50)
              ..lineTo(150, size.y)
              ..fillPath()
              ..moveTo(size.x, 0)
              ..lineTo(size.x, 230)
              ..lineTo(size.x - 60, 0)
              ..fillPath()
              ..setColor(green)
              ..moveTo(size.x, 0)
              ..lineTo(size.x, 100)
              ..lineTo(size.x - 100, 0)
              ..fillPath()
              ..setColor(lightGreen)
              ..moveTo(size.x - 30, 0)
              ..lineTo(size.x - 110, 50)
              ..lineTo(size.x - 150, 0)
              ..fillPath();
          },
        ),
      );
    },
  );
}

Future<Document> createPdfTable(
    {required List<Map<String, String>> tableData}) async {
  final Document pdf = Document();

  pdf.addPage(MultiPage(
      pageTheme: await _myPageTheme(PdfPageFormat.a4),
      build: (Context context) => <Widget>[
            Table.fromTextArray(
              context: context,
              border: null,
              headerAlignment: Alignment.centerLeft,
              cellAlignment: Alignment.centerLeft,
              headerDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: baseColor,
              ),
              headerHeight: 25,
              cellHeight: 30,
              headerStyle: TextStyle(
                color: _baseTextColor,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              cellStyle: const TextStyle(
                color: _darkColor,
                fontSize: 10,
              ),
              rowDecoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: accentColor,
                  width: .5,
                )),
              ),
              headers: List<String>.generate(
                tableData.first.length,
                (col) {
                  return tableData.first.keys.toList()[col];
                },
              ),
              data: List<List<String>>.generate(
                tableData.length,
                (row) => List<String>.generate(
                  tableData.first.length,
                  (col) {
                    return tableData[row].values.toList()[col];
                  },
                ),
              ),
            ),
          ]));
  return pdf;
}
