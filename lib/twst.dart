// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/io_client.dart';
// import 'features/authentiacation/presentation/widgets/auth-customButton.dart';
// import 'package:http/http.dart' as http;
// // class TestConflict extends StatelessWidget {
//   final http.Client client=http.Client();
//
//     String? token='149|pUuwZV0fJsResAPi8F6f7svz7GAKYODlUBPi8byl';
//    TestConflict({Key? key}) : super(key: key);
// String apiKey=String.fromCharCodes( Runes('\$2y\$10\$pY8/iyV2LkAA0HNpqpOmc.P2VoapYksgKvK0o0l7omXPaDN1L2trC'));
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(children: [
//           AuthCustomButton(buttonText: 'Login',
//           onTap: ()async{
//             HttpClient httpClient =  HttpClient()
//               ..badCertificateCallback =
//               ((X509Certificate cert, S, int port) => true);
//             IOClient ioClient =  IOClient(httpClient);
//            await ioClient.post(Uri.parse("http://crm.adsamy.com/api/login?lang=en&api_key=\$2y\$10\$pY8/iyV2LkAA0HNpqpOmc.P2VoapYksgKvK0o0l7omXPaDN1L2trC"),
//                 body: {
//                   'email':'admin@admin.com',
//                   'password':'123456'
//                 },
//
//             ).then((value)async {
//               final res=await json.decode(json.encode(value.body));
//
//              print(res);
//             });
//
//
//           },
//           ),
//
//           AuthCustomButton(buttonText: 'Logout',
//             onTap: ()async{
//               HttpClient httpClient =  HttpClient()
//                 ..badCertificateCallback =
//                 ((X509Certificate cert, S, int port) => true);
//               IOClient ioClient =  IOClient(httpClient);
//               await ioClient.post(Uri.parse("https://elite-api.elitetasty.com/api/dashboard/logout?lang=en&api_key=\$2y\$10\$pY8/iyV2LkAA0HNpqpOmc.P2VoapYksgKvK0o0l7omXPaDN1L2trC"),
//                   headers: {
//                 HttpHeaders.authorizationHeader:'Bearer $token'},
//                 body: {'user':'a7a'}
//               ).then((value)async {
//                 print (value);
//                 final res=await json.decode(json.encode(value.body));
//                 print(res);
//               });
//
//
//             },
//           ),
//         ],),
//       ),
//     );
//   }
// }
