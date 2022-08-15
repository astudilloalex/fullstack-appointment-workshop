using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AppointmentWorkshop.DOMAIN.Entities
{
    [Table("countries")]
    [Index(nameof(IsoCode), IsUnique = true)]
    [Index(nameof(Name), IsUnique = true)]
    public class Country
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(name: "id", TypeName = "SMALLINT")]
        public ushort Id { get; set; }
        
        [Column(name: "iso_code", TypeName = "CHAR(2)")]
        public string IsoCode { get; set; }

        [Column(name: "name", TypeName = "VARCHAR(100)")]
        public string Name { get; set; }

        [Column(name: "active")]
        public bool IsActive { get; set; }

        [Column(name: "creation_date")]
        public DateTime CreationDate { get; set; }

        [Column(name: "update_date")]
        public DateTime UpdateDate { get; set; }

        public Country(string isoCode, string name)
        {
            IsoCode = isoCode;
            Name = name;
        }
    }
}
