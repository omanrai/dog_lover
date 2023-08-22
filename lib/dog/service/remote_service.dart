import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/dog_model.dart';

class RemoteService {
  static var client = http.Client();

  //Fetch Dog List From Internet
  static Future<List<DogModel>?> fetchDogList() async {
    try {
      var response = await client.get(
          Uri.parse("https://api.thedogapi.com/v1/breeds"),
          headers: {"x-api-key": "ABC123"});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return dogModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", "No Internet Connection");
    }
    return null;
  }
}
