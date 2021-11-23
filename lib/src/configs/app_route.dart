





import 'package:flutter/cupertino.dart';
import 'package:mini_project/src/pages/apartment/apartment_page.dart';
import 'package:mini_project/src/pages/condo/condo_page.dart';
import 'package:mini_project/src/pages/dormitory/dormitory_page.dart';
import 'package:mini_project/src/pages/home/home_page.dart';
import 'package:mini_project/src/pages/info/info_page.dart';
import 'package:mini_project/src/pages/login/login_page.dart';
import 'package:mini_project/src/pages/mansion/mansion_page.dart';
import 'package:mini_project/src/pages/register/register_page.dart';
import 'package:mini_project/src/pages/roomtype/room_type_page.dart';
import 'package:mini_project/src/pages/roomtype/roomadd_page.dart';

class AppRoute{
  static const homeRoute = 'home';
  static const infoRoute = 'info';
  static const loginRoute = 'login';
  static const registerRoute = 'register';
  static const condoRoutr = 'condo';
  static const apartmentRoutr = 'apartment';
  static const mansionRoutr = 'mansion';
  static const dormitoryRoutr = 'dormitory';
  static const roomtypeRoutr = 'roomtype';
  static const roomaddRoutr = 'roomadd';



  final _route = <String, WidgetBuilder>{
    homeRoute: (context) => HomePage(),
    infoRoute: (context) => InfoPage(),
    loginRoute: (context) => LoginPage(),
    registerRoute: (context) => RegisterPage(),
    condoRoutr: (context) => CondoPage(),
    apartmentRoutr: (context) => ApartmentPage(),
    mansionRoutr: (context) => MansionPage(),
    dormitoryRoutr: (context) => DormitoryPage(),
    roomtypeRoutr: (context) => RoomtypePage(),
    roomaddRoutr : (context) => RoomaddPage(),

  };

  get getAll => _route;
}//end class