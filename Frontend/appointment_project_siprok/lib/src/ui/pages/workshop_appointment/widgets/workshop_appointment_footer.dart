import 'package:appointment_project_siprok/src/ui/pages/workshop_appointment/workshop_appointment_controller.dart';
import 'package:appointment_project_siprok/src/ui/utilities/screen_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkshopAppointmentFooter extends StatelessWidget {
  const WorkshopAppointmentFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final bool phone = ScreenInfo.instance.phone(context);
    return BottomAppBar(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GetBuilder<WorkshopAppointmentController>(
              builder: (controller) {
                if (controller.currentPage == 0) return const SizedBox.shrink();
                return OutlinedButton(
                  onPressed: () {
                    controller.pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: phone
                        ? const Size(100.0, 40.0)
                        : const Size(200.0, 50.0),
                    primary: Colors.black,
                  ),
                  child: Text('back'.tr),
                );
              },
            ),
            const SizedBox(width: 10.0),
            GetBuilder<WorkshopAppointmentController>(
              builder: (controller) {
                return ElevatedButton(
                  onPressed: () {
                    controller.pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: phone
                        ? const Size(100.0, 40.0)
                        : const Size(200.0, 50.0),
                    primary: Colors.black,
                    onPrimary: Colors.white,
                  ),
                  child: controller.currentPage == controller.totalPages - 1
                      ? Text('confirm'.tr)
                      : Text('next'.tr),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
