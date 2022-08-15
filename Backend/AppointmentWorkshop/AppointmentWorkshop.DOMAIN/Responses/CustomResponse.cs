namespace AppointmentWorkshop.DOMAIN.Responses
{
    /// <summary>
    /// Class to manage the responses to the client.
    /// </summary>
    public class CustomResponse
    {
        /// <summary>
        /// Generate a response with status code 200.
        /// Use to send a success notice to the client.
        /// </summary>
        /// <returns>A Dictionary object with successful message.</returns>
        public static Dictionary<string, object?> Ok()
        {
            Dictionary<string, object?> map = new()
            {
                { "status", 200 },
                { "message", "successful" },
            };
            return map;
        }

        /// <summary>
        /// Generate a response with status code 200.
        /// </summary>
        /// <typeparam name="T">The type of the object to return inside data field.</typeparam>
        /// <param name="data">The data, List or model to add inside data field.</param>
        /// <returns>A Dictionary object with successful message and data.</returns>
        public static Dictionary<string, object?> Ok<T>(T data)
        {
            Dictionary<string, object?> map = new()
            {
                { "status", 200 },
                { "message", "successful" },
                { "data", data }
            };
            return map;
        }        
    }
}
