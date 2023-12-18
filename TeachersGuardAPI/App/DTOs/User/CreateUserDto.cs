namespace TeachersGuardAPI.App.DTOs.User
{
    public class CreateUserDto
    {
        public required string EmailOrEmployeeNumber { get; set; }
        public required string Password { get; set; }
        public required string FaceImage { get; set; }
        public required string Name { get; set; }
        public required string Surnames { get; set; }
    }
}
