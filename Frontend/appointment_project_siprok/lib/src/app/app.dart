import 'package:appointment_project_siprok/src/localization/app_localization.dart';
import 'package:appointment_project_siprok/src/ui/routes/route_names.dart';
import 'package:appointment_project_siprok/src/ui/routes/route_pages.dart';
import 'package:appointment_project_siprok/src/ui/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      fallbackLocale: const Locale('es', 'EC'),
      getPages: RoutePages.pages,
      initialRoute: RouteNames.workshopAppointment,
      locale: Get.deviceLocale,
      theme: AppThemeData.light,
      translations: const AppLocalization(),
    );
  }
}
