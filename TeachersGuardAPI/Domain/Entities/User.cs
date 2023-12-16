namespace TeachersGuardAPI.Domain.Entities
{
    public class User
    {
        public string Id { get; set; } = "";
        public string EmailOrEmployeeNumber { get; set; } = "";
        public string Name { get; set; } = "";
        public string Password { get; set; } = "";
        public string Surnames { get; set; } = "";
        public string FaceImage { get; set; } = "";
        public long AttendaceNumber { get; set; }
    }
}
