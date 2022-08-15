using AppointmentWorkshop.DOMAIN.Entities;
using AppointmentWorkshop.DOMAIN.Interfaces;
using AppointmentWorkshop.INFRASTRUCTURE.Connection;
using Microsoft.EntityFrameworkCore;

namespace AppointmentWorkshop.INFRASTRUCTURE.Repositories
{
    public class CountryRepository : CrudRepository<Country, ushort>, ICountryRepository
    {

        public CountryRepository(PostgreSQLContext context) : base(context) { }

        public Task<Country?> FindByIsoCodeAsync(string isoCode)
        {
            return _context.Country.FirstOrDefaultAsync(country => country.IsoCode.Equals(isoCode));
        }
    }
}
