import 'package:appointment_project_siprok/src/ui/pages/pages.dart';
import 'package:appointment_project_siprok/src/ui/routes/route_names.dart';
import 'package:get/get.dart';

class RoutePages {
  const RoutePages._();

  static List<GetPage<dynamic>> get pages {
    return [
      GetPage(
        binding: const WorkshopAppointmentBinding(),
        name: RouteNames.workshopAppointment,
        page: () => const WorkshopAppointmentPage(),
      ),
    ];
  }
}
