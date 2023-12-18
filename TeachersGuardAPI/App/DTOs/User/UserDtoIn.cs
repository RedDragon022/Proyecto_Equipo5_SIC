namespace TeachersGuardAPI.App.DTOs.User
{
    public class UserDtoIn
    {
        public required string EmailOrEmployeeNumber { get; set; }
        public required string Password { get; set; }

    }
}
