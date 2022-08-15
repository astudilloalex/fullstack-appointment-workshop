using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AppointmentWorkshop.API.Migrations
{
    public partial class testthreemigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "iso_code",
                table: "countries",
                type: "CHAR(2)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "CHAR(2) UNIQUE");

            migrationBuilder.CreateIndex(
                name: "IX_countries_iso_code",
                table: "countries",
                column: "iso_code",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_countries_name",
                table: "countries",
                column: "name",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_countries_iso_code",
                table: "countries");

            migrationBuilder.DropIndex(
                name: "IX_countries_name",
                table: "countries");

            migrationBuilder.AlterColumn<string>(
                name: "iso_code",
                table: "countries",
                type: "CHAR(2) UNIQUE",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "CHAR(2)");
        }
    }
}
