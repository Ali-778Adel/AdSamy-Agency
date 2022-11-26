// import 'package:flutter/material.dart';
//
// import '../../../../core/resources/palette.dart';
//
// class SearchWidget extends StatelessWidget {
//   const SearchWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return        Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: TextField(
//         decoration: InputDecoration(
//             contentPadding: const EdgeInsets.symmetric(
//                 vertical: 15.0,
//             ),
//             fillColor: Colors.white.withOpacity(.01),
//             filled: true,
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: const BorderSide(width: 0.8)
//             ),
//             enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide(width: 0.8, color:Palette.darkBlue.withOpacity(.27))
//             ),
//             hintText: "Search ",
//             prefixIcon: const Icon(Icons.search, size: 30,),
//             suffixIcon: IconButton(icon: const Icon(Icons.clear), onPressed: (){})
//         ),
//
//       ),
//     );
//   }
// }
