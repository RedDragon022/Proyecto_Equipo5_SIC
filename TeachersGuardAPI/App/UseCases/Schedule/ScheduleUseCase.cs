using TeachersGuardAPI.App.DTOs.Schedule;
using TeachersGuardAPI.Domain.Repositories;
using TeachersGuardAPI.Infraestructure.Mappers;

namespace TeachersGuardAPI.App.UseCases.Schedule
{
    public class ScheduleUseCase
    {
        private readonly IScheduleRepository _scheduleRepository;
        public ScheduleUseCase(IScheduleRepository scheduleRepository) 
        {
            _scheduleRepository = scheduleRepository;
        }

        public async Task<List<ScheduleDto>?> GetScheduleByUserId(string userId)
        {
            var schedules =  await _scheduleRepository.GetSchedulesByUserId(userId);

            if (schedules == null) return null;

            return schedules.Select(ScheduleMapper.MapScheduleEntityToScheduleDto).ToList();
        }

        public async Task<bool> UserHasSchedule(string userId)
        {
            return await _scheduleRepository.UserHasSchedule(userId);
        }
    }
}
