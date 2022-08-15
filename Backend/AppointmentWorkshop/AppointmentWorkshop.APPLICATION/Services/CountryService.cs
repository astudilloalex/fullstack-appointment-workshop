using AppointmentWorkshop.DOMAIN.Entities;
using AppointmentWorkshop.INFRASTRUCTURE.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppointmentWorkshop.APPLICATION.Services
{
    public class CountryService
    {
        private readonly CountryRepository _repository;

        public CountryService(CountryRepository repository)
        {
            _repository = repository;
        }

        public Task<Country?> FindByIsoCode(string isoCode) {
            return  _repository.FindByIsoCodeAsync(isoCode);
        }
    }
}
