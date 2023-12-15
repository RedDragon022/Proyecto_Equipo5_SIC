namespace TeachersGuardAPI.Domain.Entities
{
    public class Timetable
    {
        public Guid UserId { get; set; }
        public required List<Place> Timeatable { get; set; }
    }
}
