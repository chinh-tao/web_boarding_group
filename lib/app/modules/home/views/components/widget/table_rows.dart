import 'package:flutter/material.dart';
import 'package:web_boarding_group/app/common/primary_style.dart';

class TableRows extends StatelessWidget {
  const TableRows(
      {Key? key,
      required this.stt,
      required this.id,
      required this.email,
      required this.name,
      required this.roomNumber,
      required this.device,
      this.background})
      : super(key: key);

  final Color? background;
  final String stt, id, email, name, roomNumber, device;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Table(
              columnWidths: <int, TableColumnWidth>{
                0: FixedColumnWidth(constraints.maxWidth / 10),
                1: const FlexColumnWidth(),
                2: const FlexColumnWidth(),
                3: const FlexColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                    decoration: BoxDecoration(color: background),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 13, bottom: 13, left: 20),
                        child: Text(stt, style: PrimaryStyle.normal(14)),
                      ),
                      Text(id, style: PrimaryStyle.normal(14)),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Text(email, style: PrimaryStyle.normal(14)),
                      ),
                      Text(name, style: PrimaryStyle.normal(14)),
                      Text(roomNumber, style: PrimaryStyle.normal(14)),
                      Text(device, style: PrimaryStyle.normal(14))
                    ])
              ],
            ));
  }
}
