namespace TeachersGuardAPI.Domain.Entities
{
    public class Attendance
    {
        public DateTime EntryDate { get; set; }
        public DateTime ExitDate { get; set; }
        public Guid UserId { get; set; }
        public bool FullAttendance { get; set; }
        public required Place Place { get; set; } 
    }
}
