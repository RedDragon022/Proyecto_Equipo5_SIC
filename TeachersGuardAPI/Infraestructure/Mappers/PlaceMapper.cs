using TeachersGuardAPI.App.DTOs.Place;
using TeachersGuardAPI.Domain.Entities;
using TeachersGuardAPI.Infraestructure.Models.Mongo;

namespace TeachersGuardAPI.Infraestructure.Mappers
{
    public class PlaceMapper
    {
        public static Place MapPlaceDocumentToPlaceEntity(PlaceDocument placeDocument) => new()
        { 
           Id = placeDocument.Id.ToString(),
           Name = placeDocument.Name,
        };

        public static PlaceDto MapPlaceEntityToPlaceDto(Place place) => new()
        {
            Id = place.Id,
            Name = place.Name,
        };
    }
}
