using TeachersGuardAPI.Domain.Entities;
using TeachersGuardAPI.Domain.Repositories;
using TeachersGuardAPI.Infraestructure.Mappers;
using TeachersGuardAPI.Infraestructure.Persistence.Context;

namespace TeachersGuardAPI.Infraestructure.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly MongoContext _context;
        private readonly ILogger<UserRepository> _logger;
        public UserRepository(MongoContext context, ILogger<UserRepository> logger) 
        {
            _context = context;
            _logger = logger;
        }

        public async Task<string?> CreateUserAsync(User user)
        {
           var userToDb = UserMapper.MapUserEntityToUserDocument(user);

            try
            {
                await _context.Users.InsertOneAsync(userToDb);
                
                var userId = userToDb.Id.ToString(); 
                _logger.LogInformation("User created successfully with ID: " + userId);

                return userId;
            }
            catch (Exception ex)
            {

                _logger.LogError($"Error creating user: {ex.Message}");
                return null;
            }
        }
    }
}
