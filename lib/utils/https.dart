// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import 'package:mobile_device_identifier/mobile_device_identifier.dart';
// import 'package:mybia/utils/constant_value.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:path_provider/path_provider.dart';

// class HttpParser {
//   HttpParser._();

//   static Future<Map<String, String>> header() async {
//     PackageInfo info = await PackageInfo.fromPlatform();
//     String deviceId = await MobileDeviceIdentifier().getDeviceId() ?? '';
//     // String deviceId = 'f507b7eaf6936428d';

//     return {
//       'Authorization':
//           '${Platform.isAndroid ? Constant.productionAndroidAuthToken : Platform.isIOS ? Constant.productionIosAuthToken : null}',
//       'appVersion': info.version,
//       'device_id': deviceId,
//       'fromApp': Constant.fromApp,
//       'mobileType':
//           '${Platform.isAndroid ? 'android' : Platform.isIOS ? 'ios' : null}',
//       'language': 'en',
//       'isGooglePlay':
//           '${Platform.isAndroid ? 'true' : Platform.isIOS ? 'ios' : null}',
//     };
//   }

//   static Future<dynamic> post({
//     required String url,
//     Map<String, dynamic>? body,
//   }) async {
//     try {
//       EasyLoading.show();

//       String fullUrl = '${Constant.productionDomain}$url';

//       log('full url > $fullUrl');

//       Map<String, String> headers = await header();

//       http.Response response = await http.post(
//         Uri.parse(fullUrl),
//         body: body,
//         headers: headers,
//       );

//       log('status code > ${response.statusCode}');

//       if (response.statusCode == 200) {
//         log('response data > ${response.body}');
//         EasyLoading.dismiss();
//         return jsonDecode(response.body);
//       }

//       EasyLoading.dismiss();
//       return null;
//     } on Exception {
//       EasyLoading.dismiss();
//       rethrow;
//     }
//   }

//   static Future<dynamic> submitImagesVideo({
//     required String url,
//     required Map<String, String> params,
//     required List<File?> imagesData,
//   }) async {
//     dynamic val;
//     try {
//       EasyLoading.show();

//       Map<String, String> headers = await header();

//       String mediaType1 = imagesData[0]!.path.split(".").last;
//       String mediaType2 = imagesData[1]!.path.split(".").last;
//       String mediaType3 = imagesData[2]!.path.split(".").last;

//       var request = http.MultipartRequest(
//           "POST", Uri.parse('${Constant.productionDomain}$url'))
//         ..headers.addAll(headers)
//         ..fields.addAll(params)
//         ..files.add(
//           await http.MultipartFile.fromPath(
//             'attachment1',
//             imagesData[0]!.path,
//             filename: 'attachment1.$mediaType1',
//             contentType:
//                 MediaType('image', mediaType1 == 'jpg' ? 'JPEG' : mediaType1),
//           ),
//         )
//         ..files.add(
//           await http.MultipartFile.fromPath(
//             'attachment2',
//             imagesData[1]!.path,
//             filename: 'attachment2.$mediaType2',
//             contentType:
//                 MediaType('image', mediaType2 == 'jpg' ? 'JPEG' : mediaType2),
//           ),
//         )
//         ..files.add(
//           await http.MultipartFile.fromPath(
//             'attachment3',
//             imagesData[2]!.path,
//             filename: 'attachment3.$mediaType3',
//             contentType: MediaType('video', mediaType3),
//           ),
//         );

//       await request.send().then((response) async {
//         if (response.statusCode == 200) {
//           val = await response.stream.bytesToString();
//         }
//       }).catchError((e, r) {
//         EasyLoading.dismiss();
//         throw ("response.error $e > $r");
//       });

//       EasyLoading.dismiss();
//       return val;
//     } catch (e) {
//       EasyLoading.dismiss();
//       rethrow;
//     }
//   }

//   static Future<dynamic> submitFile({
//     required String url,
//     required Map<String, String> params,
//     required Map? data,
//   }) async {
//     dynamic valSubmittedFile;
//     try {
//       EasyLoading.show();

//       Directory tempDir = await getTemporaryDirectory();
//       File file = File('${tempDir.path}/context.txt');

//       await file.create();

//       String jsonString = jsonEncode(data);
//       String jsonStringWithoutEscape = jsonString.replaceAll(r'\"', '');
//       if (await file.exists()) {
//         await file.writeAsString(jsonStringWithoutEscape);
//       }

//       Map<String, String> headers = await header();

//       var request = http.MultipartRequest(
//           "POST", Uri.parse('${Constant.productionDomain}$url'))
//         ..headers.addAll(headers)
//         ..fields.addAll(params)
//         ..files.add(
//           await http.MultipartFile.fromPath(
//             'attachment2',
//             file.path,
//             filename: 'context.txt',
//             contentType: MediaType('text', 'plain'),
//           ),
//         );

//       await request.send().then((response) async {
//         if (response.statusCode == 200) {
//           valSubmittedFile = await response.stream.bytesToString();
//           await file.delete();
//         }
//       }).catchError((e, r) {
//         EasyLoading.dismiss();
//         throw ("response.error $e > $r");
//       });

//       EasyLoading.dismiss();
//       return valSubmittedFile;
//     } catch (e) {
//       EasyLoading.dismiss();
//       rethrow;
//     }
//   }
// }
