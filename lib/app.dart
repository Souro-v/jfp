import 'package:flutter/material.dart';
import 'package:jfp/ui/loged_in/home_screen.dart';
import 'package:jfp/ui/screens/customer_register.dart';
import 'package:jfp/ui/screens/guest_register.dart';
import 'package:jfp/ui/screens/retailer_registration.dart';

class JfpApp extends StatelessWidget {
  const JfpApp({super.key});
  static GlobalKey<NavigatorState> navigatorKey= GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
        onGenerateRoute: (RouteSettings settings){
          late Widget widget;
          if(settings.name==GuestRegister.name){
            widget = const GuestRegister();
          }
          else if(settings.name== CustomerRegister.name ){
            widget=const CustomerRegister();
          }
          else if(settings.name==RetailerRegistration.name){
            widget=const RetailerRegistration();
          }
          else if(settings.name == HomeScreen.name){
            widget=const HomeScreen();

          }
          return MaterialPageRoute(builder: (_) => widget);
        }
    );
  }
}
