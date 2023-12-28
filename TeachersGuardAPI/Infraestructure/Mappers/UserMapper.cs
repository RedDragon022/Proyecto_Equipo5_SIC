using TeachersGuardAPI.App.DTOs.User;
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
            IsAdmin = userDocument.IsAdmin
        };

        public static User MapUserDTOInToUserEntity(UserDtoIn userDto) => new()
        {
          EmailOrEmployeeNumber = userDto.EmailOrEmployeeNumber,
          Password = userDto.Password
        };

        public static User MapCreateUserDtoToUserEntity(CreateUserDto createUserDto) => new()
        {
            EmailOrEmployeeNumber = createUserDto.EmailOrEmployeeNumber,
            FaceImage = createUserDto.FaceImage,
            Name = createUserDto.Name,
            Password = createUserDto.Password,
            Surnames = createUserDto.Surnames,
        };

        public static UserDtoOut MapUserEntityToUserDtoOut(User user) => new()
        {
            IsAdmin = user.IsAdmin,
            EmailOrEmployeeNumber = user.EmailOrEmployeeNumber,
            FaceImage = user.FaceImage,
            Id = user.Id,
            Name = user.Name,
            Surnames = user.Surnames
        };
    }
}
