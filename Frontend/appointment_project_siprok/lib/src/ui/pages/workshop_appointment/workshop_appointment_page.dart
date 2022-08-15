import 'package:appointment_project_siprok/src/ui/pages/workshop_appointment/widgets/workshop_appointment_first.dart';
import 'package:appointment_project_siprok/src/ui/pages/workshop_appointment/widgets/workshop_appointment_footer.dart';
import 'package:appointment_project_siprok/src/ui/pages/workshop_appointment/widgets/workshop_appointment_header.dart';
import 'package:appointment_project_siprok/src/ui/pages/workshop_appointment/workshop_appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkshopAppointmentPage extends StatelessWidget {
  const WorkshopAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final WorkshopAppointmentController controller =
        Get.find<WorkshopAppointmentController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/kia_logo.png',
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const WorkshopAppointmentHeader(),
          Expanded(
            child: PageView(
              controller: controller.pageController,
              allowImplicitScrolling: true,
              onPageChanged: controller.onChangePage,
              children: const [
                WorkshopAppointmentFirst(),
                Text('Other'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const WorkshopAppointmentFooter(),
    );
  }
}
