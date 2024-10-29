import 'package:team_giant_hockey/core/app_export.dart';
import 'package:team_giant_hockey/services/app_api_clent.dart';

class PlayOnlineController extends GetxController {
  TextEditingController gameId = TextEditingController();
  RxString generateId = ''.obs;

  void generateGameId() async {
    print(generateId.value);
    // generateId.value = "30";
    ApiClient apiClient = ApiClient();
    dynamic response = await apiClient.generateGameId();
    print("Generated game response $response");

    if (response["success"] == true) {
      generateId.value = response["data"]["game_id"].toString();
      print(generateId.value);
    }
  }
}
