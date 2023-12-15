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
        public DayOfWeek DayOfWeek { get; set; }
        [BsonElement("start")]
        public required string StartTime { get; set; }
        [BsonElement("end")]
        public required string EndTime { get; set; }

        [BsonRepresentation(BsonType.ObjectId)]
        [BsonElement("class_id")]
        public ObjectId ClassId { get; set; }
    }
}
