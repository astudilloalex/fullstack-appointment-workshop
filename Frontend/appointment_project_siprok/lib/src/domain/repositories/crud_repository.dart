import 'package:appointment_project_siprok/src/domain/responses/backend_response.dart';

/// Generic CRUD operations on a repository for a specific [T].
abstract class CrudRepository<T, ID> {
  /// Define a [CrudRepository] class.
  const CrudRepository();

  /// Deletes a given [entity].
  Future<BackendResponse<T>> delete(T entity);

  /// Deletes the given [entities].
  Future<BackendResponse<T>> deleteAll({Iterable<T>? entities});

  ///Deletes all instances of the type [T] with the given [ids].
  Future<BackendResponse<T>> deleteAllById(Iterable<ID> ids);

  /// Deletes the entity with the given [id].
  Future<BackendResponse<T>> deleteById(ID id);

  /// Returns a List of [T] inside [BackendResponse] meeting the paging restriction
  /// provided in the [page] number and page [size].
  Future<BackendResponse<T>> findAll({int page = 1, int size = 10});

  /// Returns all instances of the type [T] inside [BackendResponse] with the
  /// given [ids].
  Future<BackendResponse<T>> findAllById(Iterable<ID> ids);

  /// Retrieves an entity inside [BackendResponse] by its [id].
  Future<BackendResponse<T>> findById(ID id);

  /// Saves a given [entity].
  Future<BackendResponse<T>> save(T entity);

  /// Saves all given [entities].
  Future<BackendResponse<T>> saveAll(Iterable<T> entities);

  /// Update a given [entity].
  Future<BackendResponse<T>> update(T entity);

  /// Update all given [entities].
  Future<BackendResponse<T>> updateAll(Iterable<T> entities);
}
