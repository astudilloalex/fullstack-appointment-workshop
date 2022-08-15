using AppointmentWorkshop.DOMAIN.Entities;

namespace AppointmentWorkshop.DOMAIN.Interfaces
{
    public interface ICityRepository : ICrudRepository<City, uint>
    {
        public List<City> FindByCountryId(ushort countryId);
    }
}
