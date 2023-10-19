import 'package:get/get.dart';
import 'package:tristen/src/pages/home_screen.dart';

class RouteHelper {
  static const String homePage = '/';
  static String getHomePage()=>'$homePage';

  static List<GetPage> routes = [
    GetPage(name: homePage, page:()=>const HomeScreen()),
  ];

}