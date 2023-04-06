using Backend.Business.Services;
using Backend.Business.Interfaces;
using Backend.Infra.Data.Interfaces;
using Backend.Infra.Data.Repositories;
using Microsoft.AspNetCore.Mvc;
using Backend.Infra.Data.Context;
using Microsoft.EntityFrameworkCore;
using Backend.Infra.Data.UnitOfWork;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Code by developer ****************************
builder.Services.AddDbContext<DatabaseContext>(opts => opts.UseNpgsql(builder.Configuration.GetConnectionString("PgSqlConnection")));
builder.Services.AddScoped<IPessoaRepository, PessoaRepository>();
builder.Services.AddScoped<IPessoaService, PessoaService>();
builder.Services.AddScoped<IUnitOfWork, UnitOfWork>();

AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true); // Habilitar DateTime.Now comum 

builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());


builder.Services.AddApiVersioning(p =>
{
    p.DefaultApiVersion = new ApiVersion(1, 0);
    p.ReportApiVersions = true;
    p.AssumeDefaultVersionWhenUnspecified = true;
});

// Code by developer ****************************

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}



app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
