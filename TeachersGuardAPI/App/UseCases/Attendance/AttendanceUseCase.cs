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


        public async Task<AttendanceDtoOut> RegisterEntryAttendance(string userId)
        {
            var attendancesAlreadyExist = await GetAttendanceByUserIdAndInRangeTime(userId);



            if (attendancesAlreadyExist != null)
                return new AttendanceDtoOut { ErrorMessage = "This user has already an attendance for entry" };

            var schedules = await _scheduleRepository.GetSchedulesByUserId(userId);

            var scheduleInTimeRange = schedules?
            .Where(schedule => DateHelper.IsCurrentTimeInRange(DateTime.Now, schedule.Start, schedule.End) 
            && schedule.DayOfWeek.Contains(DateTime.Now.DayOfWeek))
            .FirstOrDefault();

            if (scheduleInTimeRange == null)
                return new AttendanceDtoOut { ErrorMessage = "This user doesn't have some activity for this day or hour" };

            var attendance = new Attendance 
            {
                UserId = userId,
                PlaceId = scheduleInTimeRange.PlaceId,
                EntryDate = DateTime.Now,
                  
            };

            var attendanceResponse = await _attendanceRepository.CreateAttendanceAsync(attendance);

            if (attendanceResponse == null) return new AttendanceDtoOut { ErrorMessage = "The entry can't be saved"};

            attendance.AttendanceId = attendanceResponse;
            

            var attendanceDto = AttendanceMapper.MapAttendanceEntityToAttendanceDtoOut(attendance);

            attendanceDto.Message = "The entry has been saved";

            return attendanceDto;
            
        }

        public async Task<bool?> RegisterExitAttendanceByUserId(string userId)
        {

            var attendanceInRangeTime = await GetAttendanceByUserIdAndInRangeTime(userId);

            if (attendanceInRangeTime == null) return null;

            return await _attendanceRepository.UpdateAttendanceAsync(attendanceInRangeTime);
        }

        private async Task<Attendance?> GetAttendanceByUserIdAndInRangeTime(string userId)
        {
            var attendances = await _attendanceRepository.GetAllAttendancesByUserIdAsync(userId);

            var currentTime = DateTime.UtcNow;
            var oneHourLater = currentTime.AddHours(1);

            return attendances?
            .FirstOrDefault(attendance =>
            attendance.EntryDate <= currentTime && currentTime <= attendance.EntryDate.AddHours(1));
        } 


    }
}
