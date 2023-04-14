import 'dart:convert';
import 'package:getx_flashcard/Utils/Api/WebControllers.dart';
import 'package:getx_flashcard/Utils/Api/WebMethodes.dart';
import 'package:getx_flashcard/Utils/Api/project_request_utils.dart';
import 'package:image_picker/image_picker.dart';

class AuthApi {
  Future<ApiResult> init({
    required String email,
  }) async {
    return RequestsUtil.instance.makeRequest(
      webController: WebControllers.auth,
      webMethod: WebMethods.init,
      postRequest: true,
      body: {'email': email},
    );
  }

  Future<ApiResult> test({
    required String email,
    required String password,
  }) async {
    return RequestsUtil.instance.makeRequest(
      webController: WebControllers.auth,
      webMethod: WebMethods.test,
      postRequest: true,
      auth: true,
      body: {
        'email': email,
        'password': password,
      },
    );
  }

  Future<ApiResult> validate({
    required String email,
    required String code,
  }) async {
    return RequestsUtil.instance.makeRequest(
      webController: WebControllers.auth,
      webMethod: WebMethods.validate,
      auth: true,
      postRequest: true,
      body: {
        'email': email,
        'code': code,
      },
    );
  }

  Future<ApiResult> completeRegister({
    required String name,
    required String lastName,
    required String password,
    required String code,
    required String mobile,
    required String email,
    required String type,
  }) async {
    return RequestsUtil.instance.makeRequest(
      webController: WebControllers.auth,
      webMethod: WebMethods.register,
      postRequest: true,
      auth: true,
      body: {
        'name': name,
        'lastName': lastName,
        'password': password,
        'code': code,
        'mobile': mobile,
        'email': email,
        'type': type
      },
    );
  }

  Future<ApiResult> login({
    required String email,
    required String password,
  }) async {
    return RequestsUtil.instance.makeRequest(
      webController: WebControllers.auth,
      webMethod: WebMethods.login,
      postRequest: true,
      auth: true,
      body: {
        'email': email,
        'password': password,
      },
    );
  }

  Future<ApiResult> forgotPassword({
    required String email,
  }) async {
    return RequestsUtil.instance.makeRequest(
      webController: WebControllers.auth,
      webMethod: WebMethods.forgot,
      postRequest: true,
      auth: true,
      body: {
        'email': email,
      },
    );
  }

  Future<ApiResult> check() async {
    return RequestsUtil.instance.makeRequest(
      webController: WebControllers.auth,
      webMethod: WebMethods.check,
      postRequest: false,
      auth: true,
    );
  }

  Future<ApiResult> updateImage(XFile file) async {
    return RequestsUtil.instance.makeRequest(
      webController: WebControllers.auth,
      webMethod: WebMethods.updateImage,
      postRequest: true,
      auth: true,
      body: {
        'image': base64Encode(await file.readAsBytes()),
      },
    );
  }

  Future<ApiResult> updateId(XFile file) async {
    return RequestsUtil.instance.makeRequest(
      webController: WebControllers.auth,
      webMethod: WebMethods.updateId,
      postRequest: true,
      auth: true,
      body: {
        'image': base64Encode(await file.readAsBytes()),
      },
    );
  }

  Future<ApiResult> updateProfile({
    required String firstName,
    required String lastName,
    required String? fullName,
    required String mobile,
    required String? avatar,
    required String email,
    required String? studyField,
    required String? studyDegree,
    required int? credit,
    required String? birthdate,
    required String? gender,
    required String type,
  }) async {
    return RequestsUtil.instance.makeRequest(
      webController: WebControllers.auth,
      webMethod: WebMethods.updateProfile,
      postRequest: true,
      auth: true,
      body: {
        'firstName': firstName,
        'lastName': lastName,
        'fullName': fullName,
        'mobile': mobile,
        'avatar': avatar,
        'email': email,
        'studyField': studyField,
        'studyDegree': studyDegree,
        'credit': credit,
        'birthdate': birthdate,
        'gender': gender,
        'type': type,
      },
    );
  }
}
