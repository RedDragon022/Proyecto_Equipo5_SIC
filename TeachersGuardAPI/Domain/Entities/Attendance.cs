namespace TeachersGuardAPI.Domain.Entities
{
    public class Attendance
    {
        public DateTime EntryDate { get; set; }
        public DateTime ExitDate { get; set; }
        public required string UserId { get; set; }
        public bool FullAttendance { get; set; } = false;
        public required string PlaceId { get; set; }
        public string AttendanceId { get; set; } = "";
    }
}
