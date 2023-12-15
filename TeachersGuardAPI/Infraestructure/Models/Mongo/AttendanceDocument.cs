using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;

namespace TeachersGuardAPI.Infraestructure.Models.Mongo
{
    public class AttendanceDocument
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId Id { get; set; }
        [BsonElement("professor_id")]

        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId ProfessorId { get; set; }
        [BsonElement("entry_date")]

        public DateTime EntryDate { get; set; }
        [BsonElement("exit_date")]
        public DateTime ExitDate { get; set; }

        [BsonRepresentation(BsonType.ObjectId)]
        [BsonElement("class_id")]
        public ObjectId ClassId { get; set; }

        [BsonElement("completed_attendance")]
        public bool IsCompletedAttendance { get; set; }
    }
}
