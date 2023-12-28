namespace TeachersGuardAPI.App.DTOs.Attendance
{
    public class AttendanceDtoOut
    {
        public string? PlaceId { get; set; }
        public string? UserId { get; set; }
        public string? AttendanceId { get; set;}
        public bool IsSaved { get; set;}
    }
}
