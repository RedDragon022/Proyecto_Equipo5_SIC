using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;

namespace TeachersGuardAPI.Infraestructure.Models.Mongo
{
    public class PlaceDocument
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId Id { get; set; }

        [BsonElement("name")]
        public required string Name { get; set; }
    }
}
