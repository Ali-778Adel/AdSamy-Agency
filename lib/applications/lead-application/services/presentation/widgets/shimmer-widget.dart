import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
  final Widget child;
  const CustomShimmerWidget({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      loop: 10,
      baseColor: Colors.grey,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child:child,
    );;
  }
}
