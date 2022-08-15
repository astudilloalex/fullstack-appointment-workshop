import 'package:appointment_project_siprok/src/domain/entities/city.dart';
import 'package:appointment_project_siprok/src/ui/pages/workshop_appointment/workshop_appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstStepCityDropdown extends StatelessWidget {
  const FirstStepCityDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkshopAppointmentController>(
      id: 'cities',
      builder: (controller) {
        return DropdownButtonFormField<City>(
          items: _data(controller.cities),
          onChanged: (value) {},
        );
      },
    );
  }

  List<DropdownMenuItem<City>> _data(List<City> cities) {
    return List<DropdownMenuItem<City>>.generate(
      cities.length,
      (index) {
        return DropdownMenuItem(
          value: cities[index],
          child: Text(cities[index].name),
        );
      },
    );
  }
}
