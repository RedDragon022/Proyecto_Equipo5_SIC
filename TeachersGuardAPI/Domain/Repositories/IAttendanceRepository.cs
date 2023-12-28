using TeachersGuardAPI.Domain.Entities;

namespace TeachersGuardAPI.Domain.Repositories
{
    public interface IAttendanceRepository
    {
        public Task<string?> CreateAttendanceAsync(Attendance attendance);
        public Task<Attendance?> GetAttendanceByUserIdAsync(string userId);
        public Task<bool?> UpdateAttendanceAsync(string userId);
    }
}
