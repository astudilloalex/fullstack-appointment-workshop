import 'package:appointment_project_siprok/src/ui/pages/workshop_appointment/widgets/header/step_info_container.dart';
import 'package:appointment_project_siprok/src/ui/pages/workshop_appointment/workshop_appointment_controller.dart';
import 'package:appointment_project_siprok/src/ui/utilities/screen_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Main App Bar to show the current step in the page.
class WorkshopAppointmentHeader extends StatelessWidget {
  /// Define a [WorkshopAppointmentHeader] class.
  const WorkshopAppointmentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> descriptions = [
      'Selecciona tu taller Kia autorizado',
      'diligenceYourData'.tr,
      'dataOfYourVehicle'.tr,
      '${'selectYourWorkshop'.tr} Kia',
      'selectDateAndTime'.tr,
      'checkYourAppointment'.tr,
    ];
    final bool phone = MediaQuery.of(context).size.width <
        ScreenInfo.instance.changePoints.desktopChangePoint;
    if (phone) {
      return GetBuilder<WorkshopAppointmentController>(
        builder: (controller) {
          return SizedBox(
            width: double.infinity,
            child: StepInfoContainer(
              currentIndex: controller.currentPage,
              description: descriptions[controller.currentPage],
            ),
          );
        },
      );
    }
    return Row(
      children: List.generate(descriptions.length, (index) {
        return Expanded(
          child: StepInfoContainer(
            currentIndex: index,
            description: descriptions[index],
          ),
        );
      }),
    );
  }
}
