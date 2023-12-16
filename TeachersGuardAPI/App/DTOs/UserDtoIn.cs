namespace TeachersGuardAPI.App.DTOs
{
    public class UserDtoIn
    {
        public required string EmailOrEmployeeNumber { get; set; }
        public required string Password { get; set; }

    }
}
