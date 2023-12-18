using MongoDB.Driver;
using TeachersGuardAPI.Domain.Entities;
using TeachersGuardAPI.Domain.Repositories;
using TeachersGuardAPI.Infraestructure.Mappers;
using TeachersGuardAPI.Infraestructure.Models.Mongo;
using TeachersGuardAPI.Infraestructure.Persistence.Context;

namespace TeachersGuardAPI.Infraestructure.Repositories
{
    public class ScheduleRepository : IScheduleRepository
    {
        private readonly MongoContext _context;
        private readonly ILogger<UserRepository> _logger;
        public ScheduleRepository(MongoContext context, ILogger<UserRepository> logger) 
        {
            _context = context;
            _logger = logger;
        }

        public async Task<List<Schedule>?> GetSchedulesByUserId(string userId)
        {
            _logger.LogInformation("Finding schedules for user with UserId: " + userId);

            var filter = Builders<ScheduleDocument>.Filter.Eq(u => u.UserId, userId);

            var scheduleDocuments = await _context.Schedules.Find(filter).ToListAsync();

            if (scheduleDocuments != null && scheduleDocuments.Any())
            {
                return scheduleDocuments.Select(ScheduleMapper.MapScheduleDocumentToScheduleEntity).ToList();
            }

            return null;
        }

    }
}
