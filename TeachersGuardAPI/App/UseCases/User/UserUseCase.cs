using TeachersGuardAPI.App.DTOs;
using TeachersGuardAPI.Infraestructure.Mappers;
using TeachersGuardAPI.Infraestructure.Repositories;

namespace TeachersGuardAPI.App.UseCases.User
{
    public class UserUseCase
    {
        private readonly UserRepository _userRepository;
        public UserUseCase(UserRepository userRepository) 
        {
            _userRepository = userRepository;
        }

        public async Task<string?> CreateUserAsync(UserDtoIn user)
        {
           var userRepository = UserMapper.MapUserDTOInToUserEntity(user);
           return await _userRepository.CreateUserAsync(userRepository);
        }
    }
}
