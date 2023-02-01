import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../utils/widgets/dash_container.dart';
import '../constants/export.dart';
import '../helper/global_functions.dart';

class RequestTile extends StatelessWidget {
  final String requester;
  final String patientName;
  final String bloodType;
  final int? amount;
  final String phoneNumber;
  final String address;
  final String hospital;
  final String email;

  const RequestTile({
    Key? key,
    required this.requester,
    required this.patientName,
    required this.bloodType,
    this.amount,
    required this.phoneNumber,
    required this.address,
    required this.hospital,
    required this.email,
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
              launchInCall(phoneNumber);
            },
            backgroundColor: AppColor.darkBlue,
            foregroundColor: Colors.white,
            icon: Icons.mail_outlined,
            label: 'Email',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Tooltip(
                    message: "Patient's Name",
                    preferBelow: false,
                    triggerMode: TooltipTriggerMode.tap,
                    child: Text(
                      requester,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Email: ', // default text style
                          style: AppStyle.regularStyle(),
                          children: <TextSpan>[
                            TextSpan(text: email, style: AppStyle.semiBold()),
                          ],
                        ),
                      ),
                      Tooltip(
                        message: "Press to mail",
                        child: GestureDetector(
                          onTap: () {
                            launchInEmail(email);
                            print("pressed mail");
                          },
                          child: const Icon(
                            Icons.mail,
                            color: AppColor.green1,
                            size: 16,
                          ),
                        ),
                      )
                    ],
                  ).p(5, 0, 0, 5),
                  Text.rich(
                    TextSpan(
                      text: 'Requester Name: ', // default text style
                      style: AppStyle.regularStyle(),
                      children: <TextSpan>[
                        TextSpan(text: patientName, style: AppStyle.semiBold()),
                      ],
                    ),
                  ).p(5, 0, 0, 5),
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
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.chat_outlined,
                          size: 16,
                        ),
                        Text(
                          " Chat now",
                          style: AppStyle.subLightStyle(),
                        ),
                      ],
                    ).pv(10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
