using AppointmentWorkshop.DOMAIN.Interfaces;
using AppointmentWorkshop.INFRASTRUCTURE.Connection;

namespace AppointmentWorkshop.INFRASTRUCTURE.Repositories
{
    /// <summary>
    /// Implementation of the CRUD repository with basic operations.
    /// </summary>
    /// <typeparam name="T">The entity type.</typeparam>
    /// <typeparam name="ID">The entity id type.</typeparam>
    public class CrudRepository<T, ID> : ICrudRepository<T, ID> where T : class
    {
        protected readonly PostgreSQLContext _context;

        public CrudRepository(PostgreSQLContext context)
        {
            _context = context;
        }

        public void Delete(T entity)
        {
            _context.Remove(entity);
        }

        public void DeleteAll(IEnumerable<T> entities)
        {
            foreach (T entity in entities) Delete(entity);
        }

        public void DeleteAllById(IEnumerable<ID> ids)
        {
            foreach (ID id in ids)
            {
                T? entity = _context.Find<T>(id);
                if (entity != null)
                {
                    Delete(entity);
                }
            }
        }

        public async Task DeleteAllByIdAsync(IEnumerable<ID> ids)
        {
            foreach (ID id in ids)
            {
                T? entity = await _context.FindAsync<T>(id);
                if (entity != null)
                {
                    Delete(entity);
                }
            }
        }

        public void DeleteById(ID id)
        {
            T? entity = _context.Find<T>(id);
            if (entity != null)
            {
                Delete(entity);
            }
        }

        public async Task DeleteByIdAsync(ID id)
        {
            T? entity = await _context.FindAsync<T>(id);
            if (entity != null)
            {
                Delete(entity);
            }
        }

        public bool ExistsById(ID id)
        {            
            return _context.Find<T>(id) != null;
        }

        public async Task<bool> ExistsByIdAsync(ID id)
        {
            return await _context.FindAsync<T>(id) != null;
        }

        public T? FindById(ID id)
        {
            return _context.Find<T>(id);
        }

        public ValueTask<T?> FindByIdAsync(ID id)
        {
            return _context.FindAsync<T>(id);
        }

        public T Save(T entity)
        {
            return _context.Add(entity).Entity;
        }

        public IEnumerable<T> SaveAll(IEnumerable<T> entities)
        {
            List<T> data = new();
            foreach (T entity in entities) data.Add(Save(entity));
            return data;
        }

        public async Task<IEnumerable<T>> SaveAllAsync(IEnumerable<T> entities)
        {
            List<T> data = new();
            foreach (T entity in entities) data.Add(await SaveAsync(entity));
            return data;
        }

        public async ValueTask<T> SaveAsync(T entity)
        {
            return (await _context.AddAsync(entity)).Entity;
        }

        public T Update(T entity)
        {
            return _context.Update(entity).Entity;
        }

        public IEnumerable<T> UpdateAll(IEnumerable<T> entities)
        {
            List<T> data = new();
            foreach (T entity in entities) data.Add(Update(entity));
            return data;
        }
    }
}
