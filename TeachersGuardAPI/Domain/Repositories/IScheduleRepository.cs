using TeachersGuardAPI.Domain.Entities;

namespace TeachersGuardAPI.Domain.Repositories
{
    public interface IScheduleRepository
    {
        public Task<List<Schedule>?> GetSchedulesByUserId(string userId);
    }
}
