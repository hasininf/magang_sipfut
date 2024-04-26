import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sipfut_app/app/home/jadwal_layout.dart';
import 'package:sipfut_app/app/login/loginpage.dart';
import 'package:sipfut_app/app/splash/splash.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String w = '0xffD0F8DB';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 1)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MyLogin(),
              routes: {
                MyJadwal.routeName: (context) => MyJadwal(),
              },
            );
          }
        });
  }
}
