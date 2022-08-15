import 'package:appointment_project_siprok/src/localization/languages/app_es_ec.dart';
import 'package:get/get.dart';

class AppLocalization implements Translations {
  const AppLocalization();

  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en_US': appEsEc,
    };
  }
}
