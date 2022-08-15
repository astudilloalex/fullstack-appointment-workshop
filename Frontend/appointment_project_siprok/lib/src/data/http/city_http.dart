import 'package:appointment_project_siprok/src/data/enums/request_method.dart';
import 'package:appointment_project_siprok/src/data/http/http_client.dart';
import 'package:appointment_project_siprok/src/domain/entities/city.dart';
import 'package:appointment_project_siprok/src/domain/repositories/city_repository.dart';
import 'package:appointment_project_siprok/src/domain/responses/backend_response.dart';

class CityHttp implements CityRepository {
  const CityHttp();

  @override
  Future<BackendResponse<City>> delete(City entity) {
    throw UnimplementedError();
  }

  @override
  Future<BackendResponse<City>> deleteAll({Iterable<City>? entities}) {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<BackendResponse<City>> deleteAllById(Iterable<int> ids) {
    // TODO: implement deleteAllById
    throw UnimplementedError();
  }

  @override
  Future<BackendResponse<City>> deleteById(int id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<BackendResponse<City>> findAll({int page = 1, int size = 10}) {
    return HttpClient.instance.request<City>(
      '/city/all-by-country-id',
      RequestMethod.get,
      parameters: {
        'country_id': '4',
      },
    );
  }

  @override
  Future<BackendResponse<City>> findAllById(Iterable<int> ids) {
    // TODO: implement findAllById
    throw UnimplementedError();
  }

  @override
  Future<BackendResponse<City>> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<BackendResponse<City>> save(City entity) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<BackendResponse<City>> saveAll(Iterable<City> entities) {
    // TODO: implement saveAll
    throw UnimplementedError();
  }

  @override
  Future<BackendResponse<City>> update(City entity) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<BackendResponse<City>> updateAll(Iterable<City> entities) {
    // TODO: implement updateAll
    throw UnimplementedError();
  }
}
