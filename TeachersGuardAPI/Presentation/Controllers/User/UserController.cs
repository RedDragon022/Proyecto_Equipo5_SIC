using Microsoft.AspNetCore.Mvc;
using TeachersGuardAPI.App.DTOs;
using TeachersGuardAPI.App.UseCases.User;
using TeachersGuardAPI.Domain.Entities;

namespace TeachersGuardAPI.Presentation.Controllers.User
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly UserUseCase _userUseCase;
        public UserController(UserUseCase userUseCase)
        {
            _userUseCase = userUseCase;
        }

        [HttpPost("create")]
        public async Task<ActionResult<UserDtoOut>> CreateUser(UserDtoIn UserDto)
        {
            var userId = await _userUseCase.CreateUserAsync(UserDto);

            if (userId == null)
            {
                StatusCode(500, new UserDtoOut { Message = "Error creating user" });
            }

            var userDtoOut = new UserDtoOut { Message = "User created successfully", UserId = userId };
            return Ok(userDtoOut);
        }
    }
}
