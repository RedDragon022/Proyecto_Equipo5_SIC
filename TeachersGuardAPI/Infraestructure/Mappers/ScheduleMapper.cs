using TeachersGuardAPI.App.DTOs.Schedule;
using TeachersGuardAPI.Domain.Entities;
using TeachersGuardAPI.Infraestructure.Models.Mongo;

namespace TeachersGuardAPI.Infraestructure.Mappers
{
    public class ScheduleMapper
    {
        public static Schedule MapScheduleDocumentToScheduleEntity(ScheduleDocument scheduleDocument) => new()
        {

            UserId = scheduleDocument.UserId,
            PlaceId = scheduleDocument.PlaceId,
            ScheduleId = scheduleDocument.Id.ToString(),
            End = scheduleDocument.EndTime,
            Start = scheduleDocument.StartTime,
            DayOfWeek = scheduleDocument.DayOfWeek,
        };

        public static ScheduleDto MapScheduleEntityToScheduleDto(Schedule schedule) => new()
        {
            DayOfWeek = schedule.DayOfWeek,
            End = schedule.End,
            PlaceId = schedule.PlaceId,
            ScheduleId = schedule.ScheduleId,
            Start = schedule.Start
        };
    }
}
