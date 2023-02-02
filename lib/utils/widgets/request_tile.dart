import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:blood_app/views/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../utils/widgets/dash_container.dart';
import '../constants/export.dart';

class RequestTile extends StatelessWidget {
  final int id;
  final String patientName;
  final String bloodType;
  final int? amount;
  final String phoneNumber;
  final String address;
  final String hospital;
  final String email;

  const RequestTile({
    Key? key,
    required this.patientName,
    required this.bloodType,
    this.amount,
    required this.phoneNumber,
    required this.address,
    required this.hospital,
    required this.email,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: .25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.

            onPressed: (context) {
              Get.to(ChatScreen(name: patientName, uid: id));
            },
            backgroundColor: AppColor.orange,
            foregroundColor: Colors.white,
            icon: Icons.chat_outlined,
            label: 'Chat',
          ),
          // SlidableAction(
          //   onPressed: (context) {
          //     launchInSMS(phoneNumber);
          //   },
          //   backgroundColor: AppColor.orange,
          //   foregroundColor: Colors.white,
          //   icon: Icons.message,
          //   label: 'Message',
          // ),
        ],
      ),
      child: DashContainer(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Tooltip(
                    message: "Patient's Name",
                    preferBelow: false,
                    triggerMode: TooltipTriggerMode.tap,
                    child: Text(
                      patientName,
                      style: AppStyle.headingStyle(),
                    ).p(5, 0, 0, 5),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Hospital: ', // default text style
                      style: AppStyle.regularStyle(),
                      children: <TextSpan>[
                        TextSpan(text: hospital, style: AppStyle.semiBold()),
                      ],
                    ),
                  ).p(5, 0, 0, 5),
                  Text.rich(
                    TextSpan(
                      text: 'Address:', // default text style
                      style: AppStyle.regularStyle(),
                      children: <TextSpan>[
                        TextSpan(text: address, style: AppStyle.semiBold()),
                      ],
                    ),
                  ).p(5, 0, 0, 5),

                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Text.rich(
                  //       TextSpan(
                  //         text: 'Email: ', // default text style
                  //         style: AppStyle.regularStyle(),
                  //         children: <TextSpan>[
                  //           TextSpan(text: email, style: AppStyle.semiBold()),
                  //         ],
                  //       ),
                  //     ),
                  //     Tooltip(
                  //       message: "Press to mail",
                  //       child: GestureDetector(
                  //         onTap: () {
                  //           launchInEmail(email);
                  //           print("pressed mail");
                  //         },
                  //         child: const Icon(
                  //           Icons.mail,
                  //           color: AppColor.green1,
                  //           size: 16,
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ).p(5, 0, 0, 5),
                  // Text.rich(
                  //   TextSpan(
                  //     text: 'Requester Name: ', // default text style
                  //     style: AppStyle.regularStyle(),
                  //     children: <TextSpan>[
                  //       TextSpan(text: patientName, style: AppStyle.semiBold()),
                  //     ],
                  //   ),
                  // ).p(5, 0, 0, 5),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Blood Type",
                    style: AppStyle.regularStyle(),
                  ),
                  Text(
                    bloodType,
                    style: AppStyle.headingStyle(
                        color: AppColor.darkPrimary, fontSize: 30),
                  ),
                  Text.rich(
                    TextSpan(
                      text: "${amount ?? "N/A"}", // default text style
                      style: AppStyle.semiBold(),

                      children: <TextSpan>[
                        // TextSpan(
                        //   text: '2',
                        //   style: StyleManager.semiBold(),
                        // ),
                        TextSpan(
                          text: '(in Pint)',
                          style: AppStyle.subLightStyle(),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ).p(5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
