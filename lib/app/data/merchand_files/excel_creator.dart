import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';

Excel createExcel({required List<Map<String, String>> tableData}) {
  final Excel excel = Excel.createExcel();

  final Sheet sheet = excel['Sheet1'];
  final CellStyle headerStyle = CellStyle(
      backgroundColorHex: "#1AFF1A",
      fontFamily: getFontFamily(FontFamily.Calibri));
  final CellStyle cellStyle = CellStyle(
    fontFamily: getFontFamily(FontFamily.Calibri),
  );

  tableData.first.keys.toList().asMap().forEach((key, value) {
    final Data cell = sheet.cell(
      CellIndex.indexByColumnRow(rowIndex: 0, columnIndex: key),
    );
    cell.value = value;
    cell.cellStyle = headerStyle;
  });

  tableData.asMap().forEach((row, rowMap) {
    rowMap.values.toList().asMap().forEach((column, data) {
      final Data cell = sheet.cell(
        CellIndex.indexByColumnRow(rowIndex: row + 1, columnIndex: column),
      );
      cell.value = data;

      cell.cellStyle = cellStyle;
    });
  });
  return excel;
}
