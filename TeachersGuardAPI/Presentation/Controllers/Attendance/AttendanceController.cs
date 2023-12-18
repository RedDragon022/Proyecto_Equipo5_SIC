using Microsoft.AspNetCore.Mvc;
using TeachersGuardAPI.App.UseCases.User;
using TeachersGuardAPI.Domain.Repositories;

namespace TeachersGuardAPI.Presentation.Controllers.Attendace
{
    [Route("api/[controller]")]
    [ApiController]
    public class AttendanceController : ControllerBase
    {
        private readonly UserUseCase _userUseCase;
        public AttendanceController(UserUseCase userUseCase) 
        {
            _userUseCase = userUseCase;
        }

        /*
        [HttpPost("register-entry")]
        public async Task<IActionResult> RegisterEntryAttendance(string userId)
        {
            if (userId == null)
            {
                return BadRequest(new { Message = "userId is missing" });
            }

            var isUserExists = await _userUseCase.FindUserById(userId);

            if (!isUserExists) return BadRequest(new { Message = "user not found" });


        }

        [HttpPost("register-exit")]
        public async Task<IActionResult> RegisterExitAttendance(string userId)
        {
            if (userId == null)
            {
                return BadRequest(new { Message = "userId is missing" });
            }

            var isUserExists = await _userUseCase.FindUserById(userId);

            if (!isUserExists) return BadRequest(new { Message = "user not found" });
        }*/
    }
}
