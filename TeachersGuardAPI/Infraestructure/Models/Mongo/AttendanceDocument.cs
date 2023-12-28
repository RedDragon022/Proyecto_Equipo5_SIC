using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;

namespace TeachersGuardAPI.Infraestructure.Models.Mongo
{
    public class AttendanceDocument
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId Id { get; set; }
        [BsonElement("user_id")]

        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId UserId { get; set; }

        [BsonElement("entry_date")]
        public DateTime EntryDate { get; set; }

        [BsonElement("exit_date")]
        public DateTime ExitDate { get; set; }

        [BsonRepresentation(BsonType.ObjectId)]
        [BsonElement("place_id")]
        public ObjectId PlaceId { get; set; }

        [BsonElement("completed_attendance")]
        public bool IsCompletedAttendance { get; set; }
    }
}
