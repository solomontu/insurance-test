import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uitest/config/app_theme_data.dart';
import 'package:uitest/data/controllers/inspections_screen_ctr.dart';
import 'package:uitest/data/controllers/inspetion_instruction_controller.dart';
import 'package:uitest/routes/base_route.dart';

import 'app_constants/route_paths.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HowToInspectCtr());
    Get.put(InspectionsCtr());
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TEST',
        getPages: BaseRoute.baseRoutes,
        initialRoute: Routes.home,
        theme: AppThemeData.themeDataLight,
      ),
    );
  }
}
