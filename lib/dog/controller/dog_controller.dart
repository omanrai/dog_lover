import 'dart:developer';

import 'package:get/get.dart';

import '../model/dog_model.dart';
import '../service/remote_service.dart';


class DogController extends GetxController {
  var dogList = <DogModel>[].obs;
  RxList<String> matchQuery = <String>[].obs;
  var isLoading = true.obs;
  var nameOfDog = [
    'apple',
    'ball',
    'cat',
    'dog',
    'elephant',
    'fish',
    'grasshoper',
    'hen',
    'ironman',
    'jeep',
    'kennel',
    'lemon'
  ];

  void buildSuggestions(String query) {
    log(query);
    matchQuery.clear();
    for (var name in nameOfDog) {
      // log(name);
      if (name.toLowerCase().contains(query.toLowerCase())) {
        log("oeoeoeo");
        matchQuery.add(name);
        print(matchQuery);
      }
    }
  }

  Future getDogList() async {
    try {
      var data = await RemoteService.fetchDogList();
      if (data != null) {
        dogList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getDogList();
  }
}
