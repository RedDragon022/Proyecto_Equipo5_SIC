namespace TeachersGuardAPI.Domain.Entities
{
    public class Place
    {
        public Guid Id { get; set; }
        public required string Name { get; set; }
        public required string BeginHour { get; set; }
        public required string EndHour { get; set; }

    }
}
