using TeachersGuardAPI.Domain.Entities;

namespace TeachersGuardAPI.Domain.Repositories
{
    public interface IUserRepository
    {
        public Task<string?> CreateUserAsync(User user);
    }
}
