namespace AppointmentWorkshop.DOMAIN.Interfaces
{
    /// <summary>
    /// Interface for generic CRUD operations on a repository for a specific type.
    /// </summary>
    /// <typeparam name="T">The entity type.</typeparam>
    /// <typeparam name="ID">The type of the entity identifier.</typeparam>
    public interface ICrudRepository<T, ID> where T : class
    {
        /// <summary>
        /// Deletes a given entity.
        /// </summary>
        /// <param name="entity">Must not be null.</param>
        public void Delete(T entity);

        /// <summary>
        /// Deletes the given entities.
        /// </summary>
        /// <param name="entities">Must not be <c>null</c>. Must not contain <c>null</c> elements.</param>
        public void DeleteAll(IEnumerable<T> entities);

        /// <summary>
        /// Deletes all instances of the type <c>T</c> with the given IDs.
        /// Entities that aren't found in the persistence store are silently ignored.
        /// </summary>
        /// <param name="ids">Must not be null and must not contain null elements.</param>
        public void DeleteAllById(IEnumerable<ID> ids);

        /// <summary>
        /// Deletes all instances of the type <c>T</c> with the given IDs async.
        /// Entities that aren't found in the persistence store are silently ignored.
        /// </summary>
        /// <param name="ids">Must not be null and must not contain null elements.</param>
        public Task DeleteAllByIdAsync(IEnumerable<ID> ids);

        /// <summary>
        /// Deletes the entity with the given id.
        /// If the entity is not found in the persistence store it is silently ignored.
        /// </summary>
        /// <param name="id">Must not be null.</param>
        public void DeleteById(ID id);

        /// <summary>
        /// Deletes the entity with the given id async.
        /// If the entity is not found in the persistence store it is silently ignored.
        /// </summary>
        /// <param name="id">Must not be null.</param>
        public Task DeleteByIdAsync(ID id);

        /// <summary>
        /// Returns whether an entity with the given id exists.
        /// </summary>
        /// <param name="id">Must not be null.</param>
        /// <returns>If an entity with the given id exists, false otherwise.</returns>
        public bool ExistsById(ID id);

        /// <summary>
        /// Returns whether an entity with the given id exists async.
        /// </summary>
        /// <param name="id">Must not be null.</param>
        /// <returns>If an entity with the given id exists, false otherwise.</returns>
        public Task<bool> ExistsByIdAsync(ID id);

        /// <summary>
        /// Retrieves an entity by its id.
        /// </summary>
        /// <param name="id">Must not be null.</param>
        /// <returns>The entity with the given id or null if not exist.</returns>
        public T? FindById(ID id);

        /// <summary>
        /// Retrieves an entity by its id async.
        /// </summary>
        /// <param name="id">Must not be null.</param>
        /// <returns>The entity with the given id or null if not exist.</returns>
        public ValueTask<T?> FindByIdAsync(ID id);

        /// <summary>
        /// Saves a given entity. Use the returned instance for further operations as the save operation might have changed the
        /// entity instance completely.
        /// </summary>
        /// <param name="entity">Must not be null.</param>
        /// <returns>The saved entity; will never be null.</returns>
        public T Save(T entity);

        /// <summary>
        /// Saves a given entity async. Use the returned instance for further operations as the save operation might have changed the
        /// entity instance completely.
        /// </summary>
        /// <param name="entity">Must not be null.</param>
        /// <returns>The saved entity async; will never be null.</returns>
        public ValueTask<T> SaveAsync(T entity);

        /// <summary>
        /// Saves all given entities.
        /// </summary>
        /// <param name="entities">Must not be null or contain null.</param>
        /// <returns>
        ///     The saved entities; will never be null. The returned List will have the same size
        ///     as the List passed as an argument.
        /// </returns>
        public IEnumerable<T> SaveAll(IEnumerable<T> entities);

        /// <summary>
        /// Saves all given entities async.
        /// </summary>
        /// <param name="entities">Must not be null or contain null.</param>
        /// <returns>
        ///     The saved entities async; will never be null. The returned List will have the same size
        ///     as the List passed as an argument.
        /// </returns>
        public Task<IEnumerable<T>> SaveAllAsync(IEnumerable<T> entities);

        /// <summary>
        /// Update a given entity. Use the returned instance for further operations as the update operation might have changed the
        /// entity instance completely.
        /// </summary>
        /// <param name="entity">Must not be null.</param>
        /// <returns>The updated entity; will never be null.</returns>
        public T Update(T entity);

        /// <summary>
        /// Update all given entities.
        /// </summary>
        /// <param name="entities">Must not be null or contain null.</param>
        /// <returns>
        ///     The updated entities; will never be null. The returned List will have the same size
        ///     as the List passed as an argument.
        /// </returns>
        public IEnumerable<T> UpdateAll(IEnumerable<T> entities);
    }
}
