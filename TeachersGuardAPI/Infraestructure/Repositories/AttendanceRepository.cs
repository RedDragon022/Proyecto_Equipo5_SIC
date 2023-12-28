using MongoDB.Bson;
using MongoDB.Driver;
using TeachersGuardAPI.Domain.Entities;
using TeachersGuardAPI.Domain.Repositories;
using TeachersGuardAPI.Infraestructure.Mappers;
using TeachersGuardAPI.Infraestructure.Models.Mongo;
using TeachersGuardAPI.Infraestructure.Persistence.Context;

namespace TeachersGuardAPI.Infraestructure.Repositories
{
    public class AttendanceRepository : IAttendanceRepository
    {
        private readonly MongoContext _context;
        private readonly ILogger<UserRepository> _logger;
        public AttendanceRepository(MongoContext context, ILogger<UserRepository> logger)
        {
            _context = context;
            _logger = logger;
        }

        public async Task<string?> CreateAttendanceAsync(Attendance attendance)
        {
            var attendanceToDb = AttendanceMapper.MapAttendanceEntityToAttendanceDocument(attendance);

            try
            {
                await _context.Attendances.InsertOneAsync(attendanceToDb);
                var attendanceId = attendanceToDb.Id.ToString();

                _logger.LogInformation("Attendance created successfully with ID: " + attendanceId);

                return attendanceId;
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error creating attendance: {ex.Message}");
                return null;
            }
        }

        public Task<Attendance?> GetAttendanceByUserIdAsync(string userId)
        {
            throw new NotImplementedException();
        }

        public async Task<bool?> UpdateAttendanceAsync(string userId)
        {
            try
            {
                var currentTime = DateTime.Now;
                var oneHourLater = currentTime.AddHours(1);

                var filter = Builders<AttendanceDocument>.Filter.And(
                    Builders<AttendanceDocument>.Filter.Eq(u => u.UserId, ObjectId.Parse(userId)),
                    Builders<AttendanceDocument>.Filter.Gte(u => u.EntryDate, currentTime),
                    Builders<AttendanceDocument>.Filter.Lt(u => u.EntryDate, oneHourLater)
                );

                // Obten la lista de asistencias que cumplen con el filtro
                var existingAttendance = await _context.Attendances.Find(filter).FirstOrDefaultAsync();

                if (existingAttendance == null)
                    return null;

                // Realiza las operaciones de actualización necesarias con las asistencias en el rango de tiempo actual
                existingAttendance.IsCompletedAttendance = true;
                existingAttendance.ExitDate = DateTime.Now;

                // Actualiza la asistencia en la base de datos
                var updateResult = await _context.Attendances.ReplaceOneAsync(filter, existingAttendance);

                // Verifica si la actualización fue exitosa
                if (updateResult.IsAcknowledged && updateResult.ModifiedCount > 0)
                    return true;

                return false;
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error updating attendance: {ex.Message}");
                return false;
            }
        }

    }
}
