import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:blood_app/views/donor_form.dart';
import 'package:blood_app/views/donors_list.dart';
import 'package:blood_app/views/profile_screen.dart';
import 'package:blood_app/views/search_blood.dart';
import 'package:flutter/material.dart';

import '../constants/export.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          DrawerHeader(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: AppColor.white,
                radius: 30,
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shrijal Shrestha",
                    style: AppStyle.headingStyle(
                        color: AppColor.textColor, fontSize: 20),
                  ).pb(4),
                  Text(
                    "9804320218",
                    style: AppStyle.subBoldStyle(
                        fontSize: 14, color: AppColor.grey),
                  )
                ],
              ),
            ],
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListTile(
                title: const Text("Home"),
                leading: const Icon(
                  Icons.home_outlined,
                  color: AppColor.darkPrimary,
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Profile"),
                leading: const Icon(
                  Icons.person_outline,
                  color: AppColor.darkPrimary,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
              ),
              ListTile(
                title: const Text("Search For Blood"),
                leading: const Icon(
                  Icons.bloodtype_outlined,
                  color: AppColor.darkPrimary,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchBlood(
                                hasAppBar: true,
                              )));
                },
              ),
              ListTile(
                title: const Text("Donors"),
                leading: const Icon(
                  Icons.people_alt_outlined,
                  color: AppColor.darkPrimary,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DonorListScreen()));
                },
              ),
              ListTile(
                title: const Text("Become a Donor"),
                leading: const Icon(
                  Icons.handshake_outlined,
                  color: AppColor.darkPrimary,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DonorForm()));
                },
              ),
              ListTile(
                title: const Text("About Us"),
                leading: const Icon(
                  Icons.info_outline,
                  color: AppColor.darkPrimary,
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Log Out"),
                leading: const Icon(
                  Icons.logout_outlined,
                  color: AppColor.darkPrimary,
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
