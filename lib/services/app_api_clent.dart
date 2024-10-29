
import '../core/app_export.dart';
import '../core/utils/exceptions.dart';
import '../core/utils/logger.dart';
import '../core/utils/network_info.dart';
import '../core/utils/progress_dialog_utils.dart';

class ApiClient extends GetConnect {
  var url = "https://game-socket-a6hv.onrender.com/game-create";

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = const Duration(seconds: 60);
  }

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    return response.isOk;
  }

  /// Performs API call for https://game-socket-a6hv.onrender.com/game-create
  ///
  /// Sends a GET request to the server's 'https://game-socket-a6hv.onrender.com/game-create' endpoint
  /// Returns a [PostPostOrganizationInviteResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<dynamic> generateGameId() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.get(
        url,
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return response.body;
      } else {
        throw response.body != null ? response.body : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  
}
