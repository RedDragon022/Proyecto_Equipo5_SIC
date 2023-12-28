using TeachersGuardAPI.App.DTOs.Attendance;
using TeachersGuardAPI.Config.helpers;
using TeachersGuardAPI.Domain.Entities;
using TeachersGuardAPI.Domain.Repositories;
using TeachersGuardAPI.Infraestructure.Mappers;

namespace TeachersGuardAPI.App.UseCases.Attendace
{
    public class AttendanceUseCase
    {
        private readonly IAttendanceRepository _attendanceRepository;
        private readonly IScheduleRepository _scheduleRepository;
        public AttendanceUseCase(
            IAttendanceRepository attendanceRepository,
            IScheduleRepository scheduleRepository
            ) 
        {
            _attendanceRepository = attendanceRepository;
            _scheduleRepository = scheduleRepository;
        }

        
        public async Task<AttendanceDtoOut?> RegisterEntryAttendance(string userId)
        {
            var schedules = await _scheduleRepository.GetSchedulesByUserId(userId);

            var scheduleInTimeRange = schedules?
            .Where(schedule => DateHelper.IsCurrentTimeInRange(DateTime.Now, schedule.Start, schedule.End) && schedule.DayOfWeek.Contains(DateTime.Now.DayOfWeek))
            .FirstOrDefault();

            if (scheduleInTimeRange == null) return null;

            var attendance = new Attendance 
            {
                UserId = userId,
                PlaceId = scheduleInTimeRange.PlaceId,
                EntryDate = DateTime.Now,
                  
            };

            var attendanceId = await _attendanceRepository.CreateAttendanceAsync(attendance);

            if (attendanceId == null) return new AttendanceDtoOut { IsSaved = false};

            attendance.AttendanceId = attendanceId;
        

            var attendanceDto = AttendanceMapper.MapAttendanceEntityToAttendanceDtoOut(attendance);

            attendanceDto.IsSaved = true;

            return attendanceDto;
            
        }

        public async Task<bool?> RegisterExitAttendanceByUserId(string userId)
        {
            return await _attendanceRepository.UpdateAttendanceAsync(userId);
        }


    }
}
