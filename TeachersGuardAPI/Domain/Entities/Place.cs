namespace TeachersGuardAPI.Domain.Entities
{
    public class Place
    {
        public required string Id { get; set; }
        public required string Name { get; set; }
        public required string BeginHour { get; set; }
        public required string EndHour { get; set; }

    }
}
