using AppointmentWorkshop.APPLICATION.Services;
using AppointmentWorkshop.DOMAIN.Entities;
using AppointmentWorkshop.DOMAIN.Responses;
using Microsoft.AspNetCore.Mvc;

namespace AppointmentWorkshop.API.Controllers
{
    [Route("api/v1/city")]
    [ApiController]
    public class CityController : ControllerBase
    {
        private readonly CityService _service;

        public CityController(CityService service)
        {
            _service = service;
        }

        [HttpGet, Route("all-by-country-id")]
        public ObjectResult FindByCountryId([FromQuery(Name = "country_id")] ushort countryCode)
        {
            return Ok(CustomResponse.Ok(_service.FindByCountryId(countryCode)));
        }
    }
}
