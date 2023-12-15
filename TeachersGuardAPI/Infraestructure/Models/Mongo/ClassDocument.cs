using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;

namespace TeachersGuardAPI.Infraestructure.Models.Mongo
{
    public class ClassDocument
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId Id { get; set; }

        [BsonElement("name")]
        public required string Name { get; set; }
        [BsonElement("start_time")]
        public required string StartTime { get; set; }
        [BsonElement("end_time")]
        public required string EndTime { get; set; }
    }
}
