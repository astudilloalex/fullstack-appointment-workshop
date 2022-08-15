using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AppointmentWorkshop.DOMAIN.Entities
{
    [Table("cities")]
    [Index(nameof(Code), IsUnique = true)]
    public class City
    {
        [Key]
        [Column(name: "id", TypeName = "INTEGER")]
        public uint Id { get; set; }

        [Column(name: "name", TypeName = "VARCHAR(150)")]
        public string Name { get; set; }

        [Column(name: "code", TypeName = "VARCHAR(20)")]
        public string Code { get; set; }

        public virtual Country? Country { get; set; }

        [Column(name: "country_id"), ForeignKey("country_id")]
        public ushort CountryId { get; set; }

        [Column(name: "active")]
        public bool IsActive { get; set; }

        [Column(name: "creation_date")]
        public DateTime CreationDate { get; set; }

        [Column(name: "update_date")]
        public DateTime UpdateDate { get; set; }

        public City(string code, string name)
        {
            Code = code;
            Name = name;
        }
    }
}
