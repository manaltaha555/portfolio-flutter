import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/presentation/sections/root_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1440, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: ScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
          ),
          theme: AppTheme.appTheme,
          title: 'portfolio',
          home: const RootPage(),
        );
      },
    );
  }
}
