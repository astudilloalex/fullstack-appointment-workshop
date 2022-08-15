using AppointmentWorkshop.APPLICATION.Services;
using AppointmentWorkshop.DOMAIN.Responses;
using AppointmentWorkshop.INFRASTRUCTURE.Connection;
using AppointmentWorkshop.INFRASTRUCTURE.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;

namespace AppointmentWorkshop.API
{
    public class Startup
    {
        private readonly IConfiguration _configuration;

        /// <summary>
        /// Default constructor to instance the class.
        /// Used or called by the Main method inside Program.cs file.
        /// </summary>
        /// <param name="configuration">Inject the set key/value configuration.</param>
        public Startup(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        /// <summary>
        /// Called by runtime to configure app; use to configure the HTTP requests.
        /// </summary>
        /// <param name="appBuilder">Mechanism to configure an application's request pipeline.</param>
        /// <param name="environment">Information about the web hosting environment an application is running in.</param>
        public void Configure(IApplicationBuilder appBuilder, IWebHostEnvironment environment)
        {
            // Set values when app is development.
            if (environment.IsDevelopment())
            {
                appBuilder.UseDeveloperExceptionPage();
                appBuilder.UseSwagger();
                appBuilder.UseSwaggerUI(options => options.SwaggerEndpoint("/swagger/v1/swagger.json", "Appointment Workshop V1"));
            }
            appBuilder.UseAuthentication();
            appBuilder.UseHttpsRedirection();
            appBuilder.UseRouting();
            appBuilder.UseAuthorization();
            appBuilder.UseCors("EnableCORS");
            appBuilder.UseStaticFiles();
            appBuilder.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }

        /// <summary>
        /// Called by runtime to configure the services; use to add services.
        /// </summary>
        /// <param name="services">Service descriptor.</param>
        public void ConfigureServices(IServiceCollection services)
        {
            // Add all controllers available in the app.
            services.AddControllers();

            // Swagger
            services.AddSwaggerGen(options =>
            {
                options.SwaggerDoc("v1", new OpenApiInfo { Title = "Appointments Workshop API V1", Version = "v1" });
            });

            // Configure to use endpoints.
            services.AddEndpointsApiExplorer();

            // Declare the use of the Npgsql package to connect with the database.
            services.AddDbContext<PostgreSQLContext>(options =>
            {
                options.UseNpgsql(_configuration.GetConnectionString("PostgreSQLConnection"));
                options.UseNpgsql(options =>
                {
                    // Use with 'dotnet ef migrations add migrationname' command for db migrations.
                    options.MigrationsAssembly("AppointmentWorkshop.API");
                });
            });

            // Enable cors policy.
            services.AddCors(options =>
            {
                options.AddPolicy("EnableCors", builder =>
                {
                    builder.AllowAnyHeader();
                    builder.AllowAnyMethod();
                    builder.SetIsOriginAllowed(_ => true);
                    builder.AllowCredentials();
                });
            });

            // Add repositories sorted alphabetically.
            services.AddScoped<CityRepository>();
            services.AddScoped<CountryRepository>();

            // Add services sorted alphabetically.
            services.AddScoped<CityService>();
            services.AddScoped<CountryService>();
        }
    }
}
