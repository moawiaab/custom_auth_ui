import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  const CustomDataTable({
    super.key,
    required this.columns,
    required this.rows,
  });

  final List<String> columns;
  final List<dynamic> rows;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: List<DataColumn>.generate(
          columns.length, (index) => DataColumn(label: Text(columns[index]))),
      rows: List<DataRow>.generate(
        rows.length,
        (int index) => DataRow(
          color: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (index.isEven) {
              return Theme.of(context).primaryColor.withOpacity(0.2);
            }
            return null; // Use default value for other states and odd rows.
          }),
          cells: List<DataCell>.generate(
              columns.length, (index) => DataCell(Text('Row $rows[index]'))),
        ),
      ),
    );
  }
}
