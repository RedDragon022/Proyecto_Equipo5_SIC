namespace TeachersGuardAPI.Domain.Entities
{
    public class AverageUserAttendance
    {
        public Guid UserId { get; set; }
        public float AverageAttendance { get; set; }
    }
}
