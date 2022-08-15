import 'package:appointment_project_siprok/src/data/http/city_http.dart';
import 'package:appointment_project_siprok/src/domain/entities/city.dart';
import 'package:appointment_project_siprok/src/domain/responses/backend_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkshopAppointmentController extends GetxController {
  WorkshopAppointmentController({
    required this.cityHttp,
  });

  final CityHttp cityHttp;

  final PageController pageController = PageController();

  int _currentPage = 0;
  final List<City> cities = <City>[];

  @override
  void onInit() {
    super.onInit();
    loadCities();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  Future<void> loadCities() async {
    final BackendResponse<City> res = await cityHttp.findAll();
    cities.addAll(res.data);
    update(['cities']);
  }

  Future<void> load() async {}

  void onChangePage(int index) {
    _currentPage = index;
    update();
  }

  int get currentPage => _currentPage;
  int get totalPages => 6;
}
