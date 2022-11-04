import 'package:flutter/material.dart';

import '../../../../../common/config.dart';
import '../../../../../common/primary_style.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({Key? key}) : super(key: key);

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
                    decoration: const BoxDecoration(color: kIndigoColor900),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 20),
                        child: Text('No',
                            style:
                                PrimaryStyle.normal(16, color: Colors.white)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Text('Căn cước/hộ chiếu',
                            style:
                                PrimaryStyle.normal(16, color: Colors.white)),
                      ),
                      Text('Số điện thoại',
                          style: PrimaryStyle.normal(16, color: Colors.white)),
                      Text('Họ và tên',
                          style: PrimaryStyle.normal(16, color: Colors.white)),
                      Text('Tên phòng',
                          style: PrimaryStyle.normal(16, color: Colors.white)),
                      Text('Thiết bị đăng kí',
                          style: PrimaryStyle.normal(16, color: Colors.white))
                    ])
              ],
            ));
  }
}
