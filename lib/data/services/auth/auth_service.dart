import 'dart:async';
import 'dart:io';
import 'package:built_collection/built_collection.dart';
import 'package:veylay/data/api/api_client.dart';
import 'package:veylay/data/services/api_service.dart';
import 'package:veylay/models/experience.dart';
import 'package:veylay/models/models.dart';
import 'package:veylay/models/subscription_plans.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as Im;
import 'dart:math' as Math;

class AuthService extends ApiService {
  AuthService({required ApiClient client}) : super(client: client);

//********************************* language-meta ******************************//
  Future<BuiltList<MetaValue>?> getAvailableLanguages(
      {Map<String, String>? headers}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: headers,
      path: '/meta/languages',
    );
    if (res.isSuccess) {
      return res.data!.languages;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************************* proximity-meta *****************************//
  Future<BuiltList<MetaValue>?> getProximity(
      Map<String, String>? headers) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: headers,
      path: '/meta/skills', //to be changed
    );
    if (res.isSuccess) {
      return res.data!.proximity;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************************* currency-meta *****************************//
  Future<BuiltList<MetaValue>?> getCurrency(
      Map<String, String>? headers) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: headers,
      path: '/meta/currencies', //to be changed
    );
    if (res.isSuccess) {
      return res.data!.currency;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************************* skills-meta *******************************//
  Future<BuiltList<MetaValue>?> getSkills(
      Map<String, String>? headers, Map<String, String>? queryToApi) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: headers,
      queryParams: queryToApi,
      path: '/meta/skills',
    );
    if (res.isSuccess) {
      return res.data!.skills;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************************* industry-meta *******************************//
  Future<BuiltList<MetaValue>?> getIndustry(
      Map<String, String>? headers) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: headers,
      path: '/meta/industries',
    );
    if (res.isSuccess) {
      return res.data!.industries;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************************* subscription-plans ************************//
  Future<BuiltList<SubscriptionPlans>?> getSubscriptionPlans(
      {Map<String, String>? headers}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: headers,
      path: '/meta/subscription_plans',
    );
    if (res.isSuccess) {
      return res.data?.subscriptionPlans;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//***************************** get-legal *************************************//
  Future<MetaValue?> getLegal(Map<String, String>? headers) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: headers,
      path: '/privacy_management/legals/current',
    );
    if (res.isSuccess) {
      return res.data!.legal;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

  //***************************** get-tax *************************************//
  Future<MetaValue?> getTax(Map<String, String>? headers) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: headers,
      path: '/meta/taxes',
    );
    if (res.isSuccess) {
      return res.data!.tax;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//***************************** update-2factor_notification *******************//
  Future<AppUser?> updateTwoFactorAuthentication(Map<String, String>? headers,
      Map<String, dynamic>? objToApi, int? id) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.PUT,
      headers: headers,
      body: objToApi,
      path: '/user_management/freelancer/freelancers/$id',
    );
    if (res.isSuccess) {
      return res.data!.user;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************************* active-session-list ***********************//
  Future<BuiltList<MetaValue>?> getActiveSessionList(
      {Map<String, String>? headers}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: headers,
      path: '/activity_management/session_activities',
    );
    if (res.isSuccess) {
      return res.data!.doorkeepers;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//****************************** remove-active-session ************************//
  Future<bool?> removeActiveSession(Map<String, String>? headers,
      Map<String, dynamic>? objToApi, bool allSessions) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.DELETE,
      headers: headers,
      queryParams: objToApi,
      path: '/activity_management/session_activities',
    );
    if (res.isSuccess) {
      return true;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************************* login-in-with-phone ***********************//
  Future<Map<String, dynamic>> loginWithPhone(
      {Map<String, dynamic>? objToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.POST,
        path: '/auth_management/freelancers/auth/login',
        body: objToApi);
    if (res.isSuccess) {
      return {'freelancer': res.data!.user!, 'token': res.data!.token!};
    } else {
      throw res.error;
    }
  }

//********************************* resend-otp *********************************//
  Future<String?> resendOtp({Map<String, dynamic>? objToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.POST,
        path: '/auth_management/freelancers/auth/resend_otp',
        body: objToApi);
    if (res.isSuccess) {
      return res.data?.success;
    } else {
      throw res.error;
    }
  }

//********************** log-in-with-password *********************************//
  Future<Map<String, dynamic>> loginWithPassword(
      {Map<String, dynamic>? objToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.POST,
        path: '/auth_management/freelancers/auth/login',
        body: objToApi);
    if (res.isSuccess) {
      return {'freelancer': res.data!.user!, 'token': res.data!.token!};
    } else {
      throw res.error;
    }
  }

//********************************* forget-password ***************************/
  Future<String?> forgotPassword({Map<String, dynamic>? objToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.POST,
        path: '/auth_management/freelancers/auth/forgot_password',
        body: objToApi);
    if (res.isSuccess) {
      return res.data?.success;
    } else {
      throw res.error;
    }
  }

//*********************************reset-password *****************************//
  Future<String?> resetPassword(
      {Map<String, dynamic>? objToApi,
      Map<String, String>? headers,
      required bool isResetPassword}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: isResetPassword ? Method.POST : Method.PUT,
        headers: headers,
        path: isResetPassword
            ? '/user_management/freelancer/freelancers/password'
            : '/auth_management/freelancers/auth/reset_password',
        body: objToApi);
    if (res.isSuccess) {
      return res.data!.success;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************************* verify-mail *******************************//
  Future<String?> verifyEmail(
      {Map<String, dynamic>? objToApi, Map<String, String>? header}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.PUT,
        headers: header,
        path: '/auth_management/freelancers/auth/verify_email',
        body: objToApi);
    if (res.isSuccess) {
      return res.data!.success;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************************* change-account ****************************//
  Future<AppUser?> changeAccount(
      {Map<String, dynamic>? objToApi,
      Map<String, String>? header,
      int? userID}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.PUT,
        headers: header,
        path: '/user_management/freelancer/freelancers/$userID',
        body: objToApi);
    if (res.isSuccess) {
      return res.data!.user;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************************* create-account ****************************//
  Future<AppUser?> createAccount({Map<String, dynamic>? objToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.POST,
        path: '/auth_management/freelancers/auth/sign_up',
        body: objToApi);
    if (res.isSuccess) {
      return res.data!.user;
    } else {
      throw res.error;
    }
  }

//********************************* get-user **********************************//
  Future<AppUser?> getUserDetails(
      {Map<String, String>? headers, int? userID}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.GET,
        path: '/user_management/freelancer/freelancers/$userID',
        headers: headers);
    if (res.isSuccess) {
      return res.data!.user;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************************* about-freelancer **************************//
  Future<AppUser?> aboutFreelancer(
      {Map<String, dynamic>? objToApi,
      required int id,
      required http.MultipartRequest multipartRequest,
      Map<String, String>? headers}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.PUT,
      headers: headers,
      formDataRequest: multipartRequest,
      path: '/user_management/freelancer/freelancers/$id',
    );
    if (res.isSuccess) {
      return res.data!.user;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************************* create-new-skill ****************************//
  Future<MetaValue?> createNewSkill(
      {Map<String, dynamic>? objToApi, Map<String, String>? header}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.POST,
        headers: header,
        path: '/meta/skills',
        body: objToApi);
    if (res.isSuccess) {
      return res.data!.skill;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************************* set-experience ****************************//
  Future<BuiltList<Experience>?> setExperience(
      {Map<String, dynamic>? objToApi,
      Map<String, String>? header,
      bool? isEdit}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: isEdit! ? Method.PUT : Method.POST,
        headers: header,
        path: '/user_management/freelancer/experiences',
        body: objToApi);
    if (res.isSuccess) {
      return res.data!.experiences;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//*************************** add other skills********************************//
  Future<ApiSuccess> addOtherSkills(
      {Map<String, dynamic>? objToApi,
      Map<String, String>? header,
      int? id}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.PUT,
        headers: header,
        path: '/user_management/freelancer/freelancer_skills/$id',
        body: objToApi);
    if (res.isSuccess) {
      return res.data!;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }



//*************************** add other languages *******************************///
  Future<ApiSuccess> addOtherLanguages(
      {Map<String, dynamic>? objToApi,
      Map<String, String>? header,
      int? id}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.PUT,
        headers: header,
        path: '/user_management/freelancer/freelancer_languages/$id',
        body: objToApi);
    if (res.isSuccess) {
      return res.data!;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************* upload-attachment-to-server ***************************//
  Future<BuiltList<MyFile>?> uploadAttachmentToServer(
      {Map<String, String>? headersToApi,
      Map<String, dynamic>? objToApi,
      required bool isDrive}) async {
    // String _path = '';
    // http.MultipartRequest multipartRequest =
    //     http.MultipartRequest('POST', Uri());
    // _path = '/content_management/contents';
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;
    // int rand = Math.Random().nextInt(10000);
    // Im.Image? image = Im.decodeImage(imageFile!.readAsBytesSync());
    // var compressedImage = File('$path/img_$rand.jpg')
    //   ..writeAsBytesSync(Im.encodeJpg(image!, quality: 85));
    // var multipartFile =
    //     await http.MultipartFile.fromPath('attachment', compressedImage.path);
    // multipartRequest.files.add(multipartFile);
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.POST,
      headers: headersToApi,
      body: objToApi,
      path: !isDrive
          ? '/content_management/contents/attachments'
          : '/content_management/contents',
    );
    if (res.isSuccess) {
      return res.data!.uploadedFile;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************************* user-notifications ************************//
  Future<AppUser?> userNotifications(
      {Map<String, dynamic>? objToApi,
      Map<String, String>? header,
      int? id}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.PUT,
        headers: header,
        path: '/user_management/freelancer/notifications',
        body: objToApi);
    if (res.isSuccess) {
      return res.data!.user;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }
  Future<AppUser?> updateHourlyRate(
      {Map<String, dynamic>? objToApi,
        Map<String, String>? header,
        int? id}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.PUT,
        headers: header,
        path: '//user_management/freelancers/freelancers/$id',
        body: objToApi);
    if (res.isSuccess) {
      return res.data!.user;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************************* user-faqs *********************************//
  Future<BuiltList<MetaValue>?> getUserFAQs(
      {Map<String, String>? headers}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: headers,
      path: '/support_management/faqs',
    );
    if (res.isSuccess) {
      return res.data?.faqs;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//**************************** report-problem *********************************//
  Future<ApiResponse> reportProblem(
      {Map<String, String>? headers, Map<String, dynamic>? bodyToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.POST,
      headers: headers,
      body: bodyToApi,
      path: '/support_management/reports',
    );
    if (res.isSuccess) {
      return res;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//************************************ logout user ****************************//
  Future<bool> logOut({Map<String, String>? headersToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.DELETE,
        path: '/auth_management/user/auth/logout',
        headers: headersToApi);
    if (res.isSuccess) {
      return true;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }
}
