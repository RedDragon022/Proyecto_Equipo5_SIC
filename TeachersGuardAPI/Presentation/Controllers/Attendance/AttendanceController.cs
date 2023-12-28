using Microsoft.AspNetCore.Mvc;
using TeachersGuardAPI.App.UseCases.Attendace;
using TeachersGuardAPI.App.UseCases.Schedule;
using TeachersGuardAPI.App.UseCases.User;

namespace TeachersGuardAPI.Presentation.Controllers.Attendace
{
    [Route("api/[controller]")]
    [ApiController]
    public class AttendanceController : ControllerBase
    {
        private readonly UserUseCase _userUseCase;
        private readonly AttendanceUseCase _attendanceUseCase;
        private readonly ScheduleUseCase _scheduleUseCase;
        public AttendanceController(
            UserUseCase userUseCase,
            AttendanceUseCase attendanceUseCase,
            ScheduleUseCase scheduleUseCase
            ) 
        {
            _userUseCase = userUseCase;
            _attendanceUseCase = attendanceUseCase;
            _scheduleUseCase = scheduleUseCase;
        }

        
        [HttpPost("register-entry")]
        public async Task<IActionResult> RegisterEntryAttendance(string userId)
        {
        
            var isUserExists = await _userUseCase.FindUserById(userId);

            if (!isUserExists) return BadRequest(new { Message = "User not found" });

          
            var userHasSchedule = await _scheduleUseCase.UserHasSchedule(userId);

            if (!userHasSchedule) return BadRequest(new { Message = "This user doesn't have some schedule" });


            var attendance = await _attendanceUseCase.RegisterEntryAttendance(userId);

            if (attendance == null) return Conflict(new { Message = "User can't register the attendance, because it's not the hour" });

            if (!attendance.IsSaved) return StatusCode(500, new { Message = "Error while saving the attendance, try later" });

            return Ok(attendance);
        }
        
        [HttpPost("register-exit")]
        public async Task<IActionResult> RegisterExitAttendance(string userId)
        {
            if (userId == null)
            {
                return BadRequest(new { Message = "userId is missing" });
            }

            var isUserExists = await _userUseCase.FindUserById(userId);

            if (!isUserExists) return BadRequest(new { Message = "User not found" });

            var isAttendanceSaved = await _attendanceUseCase.RegisterExitAttendanceByUserId(userId);

            if (isAttendanceSaved == null) return Conflict(new {Message = "In this time can't be registered exit attendance, because this not in range"});

            if ((bool)!isAttendanceSaved) return StatusCode(500, new { Message = "Error while saving the exit attendance, try later" });

            return Ok(new {Message = "Exit attendance was saved successfully"});
        }
    }
}
