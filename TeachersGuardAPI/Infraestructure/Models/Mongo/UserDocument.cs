using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;

namespace TeachersGuardAPI.Infraestructure.Models.Mongo
{
    public class UserDocument
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId Id { get; set; }

        [BsonElement("name")]
        public required string Name { get; set; }

        [BsonElement("email_or_employee_number")]
        public required string EmailOrEmployeeNumber { get; set; }

        [BsonElement("surnames")]
        public required string Surnames { get; set; }

        [BsonElement("face_image")]
        public required string FaceImage { get; set; }

        [BsonElement("password")]
        public required string Password { get; set; }
     
        [BsonElement("assigned_classes")]
        public List<ObjectId>? AssignedClasses { get; set; }

        [BsonElement("attendance_number")]
        public long AttendaceNumber { get; set; }

    }
}
