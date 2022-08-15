using AppointmentWorkshop.DOMAIN.Entities;
using AppointmentWorkshop.DOMAIN.Interfaces;
using AppointmentWorkshop.INFRASTRUCTURE.Connection;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppointmentWorkshop.INFRASTRUCTURE.Repositories
{
    public class CityRepository : CrudRepository<City, uint>, ICityRepository
    {
        public CityRepository(PostgreSQLContext context) : base(context) { }

        public List<City> FindByCountryId(ushort countryId)
        {
            return _context.City.Where(city => city.CountryId == countryId).ToList();
        }
    }
}
