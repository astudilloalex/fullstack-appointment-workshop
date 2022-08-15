using AppointmentWorkshop.DOMAIN.Entities;

namespace AppointmentWorkshop.DOMAIN.Interfaces
{
    public interface ICountryRepository : ICrudRepository<Country, ushort>
    {
        public Task<Country?> FindByIsoCodeAsync(string isoCode);
    }
}
