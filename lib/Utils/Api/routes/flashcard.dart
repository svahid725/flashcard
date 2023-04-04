import 'package:getx_flashcard/Utils/Api/WebControllers.dart';
import 'package:getx_flashcard/Utils/Api/WebMethodes.dart';
import 'package:getx_flashcard/Utils/Api/project_request_utils.dart';

class FlashCardsApi {
  Future<ApiResult> categories({
    required int id,
    required String name,
  }) async {
    return RequestsUtil.instance.makeRequest(
      webController: WebControllers.flashcard,
      webMethod: WebMethods.categories,
      postRequest: true,
      auth: true,
      body: {'id': id, 'name': name},
    );
  }

  Future<ApiResult> addFlashCard({
    required int groupId,
    required String questionTitle,
    required String question,
    required String answerTitle,
    required String answer,
  }) async {
    return RequestsUtil.instance.makeRequest(
      webController: WebControllers.flashcard,
      webMethod: WebMethods.addFlashCard,
      postRequest: true,
      auth: true,
      body: {
        'groupId': groupId,
        'questionTitle': questionTitle,
        'question': question,
        'answerTitle': answerTitle,
        'answer': answer,
      },
    );
  }

  Future<ApiResult> flashCards() async {
    return RequestsUtil.instance.makeRequest(
        webController: WebControllers.flashcard,
        webMethod: WebMethods.flashCards,
        postRequest: true,
        auth: true,
        body: {
          'groupId': 1,
        }
    );
  }
}
