using MongoDB.Driver;
using TeachersGuardAPI.Domain.Entities;
using TeachersGuardAPI.Domain.Repositories;
using TeachersGuardAPI.Infraestructure.Mappers;
using TeachersGuardAPI.Infraestructure.Models.Mongo;
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

        public async Task<User?> GetUserAsync(User user)
        {
            _logger.LogInformation("Finding user with EmailOrEmployeeNumber: " + user.EmailOrEmployeeNumber);

            var filter = Builders<UserDocument>.Filter.Eq(u => u.EmailOrEmployeeNumber, user.EmailOrEmployeeNumber);

            var userDocument = await _context.Users.Find(filter).SingleOrDefaultAsync();

            if (userDocument != null)
            {
               return UserMapper.MapUserDocumentToUserEntity(userDocument);
            }

            return null;
            
        }

        public async Task<bool> IsExistUserById(string userId)
        {
            _logger.LogInformation("Finding user with EmailOrEmployeeNumber: " + userId);

            var filter = Builders<UserDocument>.Filter.Eq(u => u.Id.ToString(), userId);

            var userCount = await _context.Users.CountDocumentsAsync(filter);

            return userCount > 0;
        }
    }
}
