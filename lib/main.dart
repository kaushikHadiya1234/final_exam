import 'package:final_exam/Screen/View/bookmark_screen.dart';
import 'package:final_exam/Screen/View/home_screen.dart';
import 'package:final_exam/Screen/View/read_screen.dart';
import 'package:final_exam/Screen/View/search_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(Sizer(
    builder: (context, orientation, deviceType) =>  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (p0) => HomeScreen(),
        'read': (p0) => ReadScreen(),
        'search': (p0) => SearchScreen(),
        'bmark': (p0) => Bookmark(),
      },
    ),
  ),);
}