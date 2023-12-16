namespace TeachersGuardAPI.App.DTOs
{
    public class UserDtoIn
    {
        public required string EmailOrEmployeeNumber { get; set; }
        public required string FaceImage { get; set; }
        public required string Name { get; set; }
        public required string Surnames { get; set; }
        public required string Password { get; set; }

    }
}
