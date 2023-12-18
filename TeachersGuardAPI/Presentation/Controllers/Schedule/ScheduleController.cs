using Microsoft.AspNetCore.Mvc;
using TeachersGuardAPI.App.DTOs.Schedule;
using TeachersGuardAPI.App.UseCases.Schedule;

namespace TeachersGuardAPI.Presentation.Controllers.Schedule
{
    [Route("api/[controller]")]
    [ApiController]
    public class ScheduleController : ControllerBase
    {
        private readonly ScheduleUseCase _scheduleUseCase;
        public ScheduleController(ScheduleUseCase scheduleUseCase)
        {
            _scheduleUseCase = scheduleUseCase;
        }

        [HttpGet]
        public async Task<ActionResult<List<ScheduleDto>?>> GetScheduleByUserId(string userId)
        {
            if (userId == null) return BadRequest("userId must be provided");

            var schedules = await _scheduleUseCase.GetScheduleByUserId(userId);

            return schedules != null ? Ok(schedules) : NotFound("This user maybe doesn't has a schedule");
        }

    }
}
