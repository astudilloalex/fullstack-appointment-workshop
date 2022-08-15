using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AppointmentWorkshop.API.Migrations
{
    public partial class testtwomigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "iso_code",
                table: "countries",
                type: "CHAR(2) UNIQUE",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "CHAR(2)");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "iso_code",
                table: "countries",
                type: "CHAR(2)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "CHAR(2) UNIQUE");
        }
    }
}
