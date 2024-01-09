import 'dart:convert';
import 'package:dataspot_machine_test/model/user_model.dart';
import 'package:flutter/material.dart';

class HomeState extends ChangeNotifier {
  bool _isLoading = false;
  List<User> userDetailsList = [];
  List<User> allusersData = [];

  TextEditingController userSearchController = TextEditingController();
  // ignore: unnecessary_getters_setters
  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
  }

  Future<void> fetchUserData(BuildContext context) async {
    try {
      isLoading = true;
      String jsonData = await DefaultAssetBundle.of(context)
          .loadString('assets/json/users_list.json');
      List<dynamic> usersData = jsonDecode(jsonData)['Response']['Users'];

      userDetailsList.clear();
      for (var userData in usersData) {
        User user = User(
          name: userData['Name'],
          email: userData['Email'],
          image: userData['image'],
          region: userData['region'],
          mobile: userData['mobile'],
          zone: userData['zone'],
          isOnline: userData['isOnline'],
        );

        userDetailsList.add(user);
        userDetailsList.sort((a, b) => a.name.compareTo(b.name));
        allusersData.add(user);
        allusersData.sort((a, b) => a.name.compareTo(b.name));
      }
      isLoading = false;
      notifyListeners();
    } finally {
      isLoading = false;
    }
  }

  void userSearch() {
    userDetailsList.clear();
    userDetailsList.addAll(allusersData
        .where((user) => user.name
            .toUpperCase()
            .contains(userSearchController.text.toUpperCase()))
        .toList());
    notifyListeners();
  }
}
