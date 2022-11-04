import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:web_boarding_group/app/common/primary_style.dart';
import 'package:web_boarding_group/app/modules/home/controllers/home_controller.dart';
import 'package:web_boarding_group/app/modules/home/views/components/widget/table_header.dart';
import 'package:web_boarding_group/app/modules/home/views/components/widget/table_rows.dart';
import 'package:web_boarding_group/app/widget/button/button_loading.dart';
import 'package:web_boarding_group/app/widget/button/second_outlined_button.dart';
import 'package:web_boarding_group/app/widget/custom_input.dart';

import '../../../../../common/config.dart';

class AddMember extends StatelessWidget {
  const AddMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                    child: CustomInput(
                        paddingLeft: 7,
                        title: 'ID người dùng',
                        err: _.listErr[0],
                        controller: _.inputUserId)),
                const SizedBox(width: 50),
                Expanded(
                    child: Padding(
                  padding:
                      EdgeInsets.only(bottom: _.listErr[0].isEmpty ? 0 : 15),
                  child: CustomInput(
                      paddingLeft: 7,
                      title: 'Tên thành viên',
                      controller: _.inputUserName),
                ))
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding:
                      EdgeInsets.only(bottom: _.listErr[1].isEmpty ? 0 : 15),
                  child: CustomInput(
                      paddingLeft: 7,
                      title: 'Tên phòng',
                      controller: _.inputUserRoom),
                )),
                const SizedBox(width: 50),
                Expanded(
                    child: CustomInput(
                        paddingLeft: 7,
                        title: 'Số điện thoại',
                        err: _.listErr[1],
                        controller: _.inputPhone))
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SecondOutlinedButton(
                    height: 45,
                    width: 150,
                    sizeText: 15,
                    title: 'Làm mới',
                    color: kGreenColor_700.withOpacity(0.8),
                    onPressed: () => _.handleClear()),
                const SizedBox(width: 20),
                Obx(() => ButtonLoading(
                    radius: 7,
                    height: 45,
                    width: 150,
                    isLoading: _.isLoading[0],
                    sizeContent: 15,
                    titleButton: 'Gửi',
                    onPressed: () => _.handleAddUser(context))),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 70),
            const TableHeader(),
            if (_.listUser.isEmpty) ...[
              Column(
                children: [
                  const SizedBox(height: 100),
                  Center(
                    child: Text('Không tìm thấy dữ liệu',
                        style: PrimaryStyle.bold(18, color: kRedColor_400)),
                  )
                ],
              )
            ] else
              Expanded(
                  child: ListView.builder(
                      itemCount: _.listUser.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return TableRows(
                            background: index % 2 == 0
                                ? kIndigoColor50
                                : kIndigoColor100,
                            stt: '${index + 1}',
                            id: _.listUser[index].getID,
                            phone: _.listUser[index].getPhone,
                            name: _.listUser[index].getUserName,
                            roomNumber: _.listUser[index].getRoomNumber,
                            device: _.listUser[index].getDevice);
                      }))
          ],
        ),
      );
    });
  }
}
