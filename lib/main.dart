import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tristen/src/routes/route_helper.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    initialRoute: RouteHelper.homePage,
      getPages: RouteHelper.routes,
    );
  }
}

