using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;

namespace TeachersGuardAPI.Infraestructure.Models.Mongo
{
    public class ScheduleDocument
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId Id { get; set; }

        [BsonElement("day_of_week")]
        public required List<DayOfWeek> DayOfWeek { get; set; }
        [BsonElement("start")]
        public required string StartTime { get; set; }
        [BsonElement("end")]
        public required string EndTime { get; set; }

        [BsonElement("user_id")]
        public required string UserId { get; set; }

        [BsonElement("place_id")]
        public required string PlaceId { get; set; }
    }
}
