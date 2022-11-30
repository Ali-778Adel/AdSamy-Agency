import 'package:flutter/material.dart';
import 'main-launch.dart';
import 'package:ad_samy/di/dependency_injection_container.dart' as da;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await da.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Launch().call();
  }
}

