namespace TeachersGuardAPI.Domain.Entities
{
    public class User
    {
        public Guid Id { get; set; }
        public required string Email { get; set; }
        public required string Name { get; set; }
        public required string Password { get; set; }
        public required string Surnames { get; set;}
        public required IFileHttpResult FaceImage { get; set;}
        public required long AttendaceNumber { get; set; }
    }
}
