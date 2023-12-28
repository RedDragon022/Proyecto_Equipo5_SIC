using MongoDB.Bson;
using TeachersGuardAPI.App.DTOs.Attendance;
using TeachersGuardAPI.Domain.Entities;
using TeachersGuardAPI.Infraestructure.Models.Mongo;

namespace TeachersGuardAPI.Infraestructure.Mappers
{
    public class AttendanceMapper
    {
        public static AttendanceDocument MapAttendanceEntityToAttendanceDocument(Attendance attendance) => new()
        {
            EntryDate = attendance.EntryDate,
            ExitDate = attendance.ExitDate,
            PlaceId = ObjectId.Parse(attendance.PlaceId),
            UserId = ObjectId.Parse(attendance.UserId),
            IsCompletedAttendance = attendance.FullAttendance
        };

        public static AttendanceDtoOut MapAttendanceEntityToAttendanceDtoOut(Attendance attendance) => new()
        {
            PlaceId = attendance.PlaceId,
            UserId = attendance.UserId,
            AttendanceId = attendance.AttendanceId,
        };
    }
}
