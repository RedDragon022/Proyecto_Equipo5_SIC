using TeachersGuardAPI.App.DTOs;
using TeachersGuardAPI.Domain.Entities;
using TeachersGuardAPI.Infraestructure.Models.Mongo;

namespace TeachersGuardAPI.Infraestructure.Mappers
{
    public class UserMapper
    {
        public static UserDocument MapUserEntityToUserDocument(User user) => new()
        { 
            Name = user.Name,
            Password = user.Password,
            Surnames = user.Surnames,
            FaceImage = user.FaceImage,
            EmailOrEmployeeNumber = user.EmailOrEmployeeNumber,
        };

        public static User MapUserDocumentToUserEntity(UserDocument userDocument) => new()
        {
            FaceImage = userDocument.FaceImage,
            Name = userDocument.Name,
            EmailOrEmployeeNumber = userDocument.EmailOrEmployeeNumber,
            Id = userDocument.Id.ToString(),
            Password = userDocument.Password,
            Surnames = userDocument.Surnames,
            AttendaceNumber = userDocument.AttendaceNumber
        };

        public static User MapUserDTOInToUserEntity(UserDtoIn userDto) => new()
        {
            EmailOrEmployeeNumber = userDto.EmailOrEmployeeNumber,
            FaceImage = userDto.FaceImage,
            Name = userDto.Name,
            Password = userDto.Password,
            Surnames= userDto.Surnames,
        };
    }
}
