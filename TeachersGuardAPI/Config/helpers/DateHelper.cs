using System.Globalization;

namespace TeachersGuardAPI.Config.helpers
{
    public class DateHelper
    {
        public static bool IsCurrentTimeInRange(DateTime currentTime, string startTimeStr, string endTimeStr)
        {
            // Convert the time strings to TimeSpan objects
           

            startTimeStr = startTimeStr.Trim();
            endTimeStr = endTimeStr.Trim();

            // Use "HH:mm" format instead of "h:mm tt" to ensure 24-hour time format
            TimeSpan startTime = TimeSpan.Parse(startTimeStr);
            TimeSpan endTime = TimeSpan.Parse(endTimeStr);

            // Convert the current time to a TimeSpan object
            TimeSpan currentTimeOfDay = currentTime.TimeOfDay;

            // Check if the current time is within the specified range
            return currentTimeOfDay >= startTime && currentTimeOfDay <= endTime;
        }

    }
}
