using AppointmentWorkshop.APPLICATION.Services;
using AppointmentWorkshop.DOMAIN.Entities;
using AppointmentWorkshop.DOMAIN.Responses;
using Microsoft.AspNetCore.Mvc;

namespace AppointmentWorkshop.API.Controllers
{
    [Route("api/v1/country")]
    [ApiController]
    public class CountryController : ControllerBase
    {
        private readonly CountryService _service;

        public CountryController(CountryService service)
        {
            _service = service;
        }

        [HttpGet]
        public Task<Country?> FindByIsoCode([FromQuery(Name = "iso_code")] string isoCode)
        {
            return _service.FindByIsoCode(isoCode);
        }
    }
}
