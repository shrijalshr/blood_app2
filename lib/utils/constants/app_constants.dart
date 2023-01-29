import 'package:blood_app/models/location.model.dart';

class MyConstants {
  MyConstants._();

  static const bloodGroups = [
    'A+',
    'B+',
    'AB+',
    'O+',
    'A-',
    'B-',
    'AB-',
    'O-',
  ];

  static const List<LocationModel> locations = <LocationModel>[
    LocationModel(
      id: 1,
      name: "Biratnagar",
    ),
    LocationModel(
      id: 2,
      name: "Kathmandu",
    ),
    LocationModel(
      id: 3,
      name: "Itahari",
    ),
    LocationModel(
      id: 4,
      name: "Dharan",
    ),
    LocationModel(
      id: 5,
      name: "Jhapa",
    ),
    LocationModel(
      id: 6,
      name: "Lalitpur",
    ),
    LocationModel(
      id: 7,
      name: "Bhaktapur",
    ),
  ];
}
