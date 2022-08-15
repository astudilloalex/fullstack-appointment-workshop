import 'package:appointment_project_siprok/src/data/http/city_http.dart';
import 'package:appointment_project_siprok/src/ui/pages/workshop_appointment/workshop_appointment_controller.dart';
import 'package:get/get.dart';

class WorkshopAppointmentBinding implements Bindings {
  const WorkshopAppointmentBinding();

  @override
  void dependencies() {
    Get.lazyPut<WorkshopAppointmentController>(
      () => WorkshopAppointmentController(cityHttp: const CityHttp()),
    );
  }
}
