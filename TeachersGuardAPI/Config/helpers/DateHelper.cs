namespace TeachersGuardAPI.Config.helpers
{
    public class DateHelper
    {
        static bool IsCurrentTimeInRange(DateTime currentTime, string startTimeStr, string endTimeStr)
        {
            // Convert the time strings to TimeSpan objects
            TimeSpan startTime = TimeSpan.ParseExact(startTimeStr, "h:mm tt", null);
            TimeSpan endTime = TimeSpan.ParseExact(endTimeStr, "h:mm tt", null);

            // Convert the current time to a TimeSpan object
            TimeSpan currentTimeOfDay = currentTime.TimeOfDay;

            // Check if the current time is within the specified range
            return currentTimeOfDay >= startTime && currentTimeOfDay <= endTime;
        }
    }
}
