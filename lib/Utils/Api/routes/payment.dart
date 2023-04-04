import 'package:getx_flashcard/Utils/Api/WebControllers.dart';
import 'package:getx_flashcard/Utils/Api/WebMethodes.dart';
import 'package:getx_flashcard/Utils/Api/project_request_utils.dart';

class PaymentApi {
  Future<ApiResult> init({
    required String price,
  }) async {
    return RequestsUtil.instance.makeRequest(
      webController: WebControllers.flashcard,
      webMethod: WebMethods.donate,
      postRequest: true,
      body: {
        'price': price
      },
    );
  }
}