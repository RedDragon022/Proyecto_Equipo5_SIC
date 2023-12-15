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
        [BsonElement("face_image")]

        public required string FaceImage { get; set; }
        [BsonElement("password")]
        public required string Password { get; set; }

     
        [BsonElement("assigned_classes")]
        public List<ObjectId>? AssignedClasses { get; set; }

    }
}
