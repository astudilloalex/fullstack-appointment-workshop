using AppointmentWorkshop.DOMAIN.Entities;
using AppointmentWorkshop.INFRASTRUCTURE.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppointmentWorkshop.APPLICATION.Services
{
    public class CityService
    {
        private readonly CityRepository _repository;

        public CityService(CityRepository repository)
        {
            _repository = repository;
        }

        public List<City> FindByCountryId(ushort countryId)
        {
            return _repository.FindByCountryId(countryId);
        }
    }
}
