using Microsoft.Extensions.Options;
using MongoDB.Driver;
using TeachersGuardAPI.Config.constants;
using TeachersGuardAPI.Infraestructure.Models.Mongo;

namespace TeachersGuardAPI.Infraestructure.Persistence.Context
{
    public class MongoContext
    {
        private readonly IMongoDatabase _database;

        public MongoContext(IOptions<MongoConfig> mongoConfig)
        {
            var config = mongoConfig.Value;

            var client = new MongoClient(config.ConnectionString);
            _database = client.GetDatabase(config.DatabaseName);
        }

        public IMongoDatabase GetDatabase => _database;
        public IMongoCollection<UserDocument> Users => GetDatabase.GetCollection<UserDocument>("users");
        public IMongoCollection<AttendanceDocument> Attendances => GetDatabase.GetCollection<AttendanceDocument>("attendance");
        public IMongoCollection<PlaceDocument> Places => GetDatabase.GetCollection<PlaceDocument>("places");
        public IMongoCollection<ScheduleDocument> Schedules => GetDatabase.GetCollection<ScheduleDocument>("schedules");
    }
}
