using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace AppointmentWorkshop.API.Migrations
{
    public partial class testonemigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Name",
                table: "countries",
                newName: "name");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "countries",
                newName: "id");

            migrationBuilder.RenameColumn(
                name: "UpdateDate",
                table: "countries",
                newName: "update_date");

            migrationBuilder.RenameColumn(
                name: "IsoCode",
                table: "countries",
                newName: "iso_code");

            migrationBuilder.RenameColumn(
                name: "IsActive",
                table: "countries",
                newName: "active");

            migrationBuilder.RenameColumn(
                name: "CreationDate",
                table: "countries",
                newName: "creation_date");

            migrationBuilder.AlterColumn<string>(
                name: "name",
                table: "countries",
                type: "VARCHAR(100)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AlterColumn<short>(
                name: "id",
                table: "countries",
                type: "SMALLINT",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "integer")
                .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn)
                .OldAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

            migrationBuilder.AlterColumn<string>(
                name: "iso_code",
                table: "countries",
                type: "CHAR(2)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "text");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "name",
                table: "countries",
                newName: "Name");

            migrationBuilder.RenameColumn(
                name: "id",
                table: "countries",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "update_date",
                table: "countries",
                newName: "UpdateDate");

            migrationBuilder.RenameColumn(
                name: "iso_code",
                table: "countries",
                newName: "IsoCode");

            migrationBuilder.RenameColumn(
                name: "creation_date",
                table: "countries",
                newName: "CreationDate");

            migrationBuilder.RenameColumn(
                name: "active",
                table: "countries",
                newName: "IsActive");

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "countries",
                type: "text",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "VARCHAR(100)");

            migrationBuilder.AlterColumn<int>(
                name: "Id",
                table: "countries",
                type: "integer",
                nullable: false,
                oldClrType: typeof(short),
                oldType: "SMALLINT")
                .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn)
                .OldAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

            migrationBuilder.AlterColumn<string>(
                name: "IsoCode",
                table: "countries",
                type: "text",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "CHAR(2)");
        }
    }
}
