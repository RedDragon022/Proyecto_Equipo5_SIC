using TeachersGuardAPI.App.UseCases.User;
using TeachersGuardAPI.Config.constants;
using TeachersGuardAPI.Domain.Repositories;
using TeachersGuardAPI.Infraestructure.Persistence.Context;
using TeachersGuardAPI.Infraestructure.Repositories;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.Configure<MongoConfig>(builder.Configuration.GetSection("MongoSettings"));

builder.Services.AddSingleton<MongoContext>();

builder.Services.AddScoped<IUserRepository, UserRepository>();

builder.Services.AddScoped<UserUseCase>();


builder.Services.AddLogging();

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();


app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
