using TeachersGuardAPI.Domain.Entities;
using TeachersGuardAPI.Domain.Repositories;
using TeachersGuardAPI.Infraestructure.Persistence.Context;

namespace TeachersGuardAPI.Infraestructure.Repositories
{
    public class AttendanceRepository : IAttendanceRepository
    {
        private readonly MongoContext _context;
        private readonly ILogger<UserRepository> _logger;
        public AttendanceRepository(MongoContext context, ILogger<UserRepository> logger)
        {
            _context = context;
            _logger = logger;
        }

        public Task<string?> CreateAttendanceAsync(Attendance attendance)
        {
            throw new NotImplementedException();
        }

        public Task<Attendance?> GetAttendanceByUserIdAsync(string userId)
        {
            throw new NotImplementedException();
        }

        public Task UpdateAttendanceAsync(Attendance attendance)
        {
            throw new NotImplementedException();
        }
    }
}
