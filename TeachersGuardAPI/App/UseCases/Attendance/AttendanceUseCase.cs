using TeachersGuardAPI.Domain.Entities;
using TeachersGuardAPI.Domain.Repositories;

namespace TeachersGuardAPI.App.UseCases.Attendace
{
    public class AttendanceUseCase
    {
        private readonly IAttendanceRepository _attendanceRepository;
        public AttendanceUseCase(IAttendanceRepository attendanceRepository) 
        {
            _attendanceRepository = attendanceRepository;
        }

        /*
        public async async RegisterEntryAttendance(string userId)
        {
            var attendance = new Attendance
            {
                UserId = userId,
                EntryDate = DateTime.Now,
                PlaceId = 

            };



            await _attendanceRepository.CreateAttendanceAsync(attendance);
        }*/


    }
}
