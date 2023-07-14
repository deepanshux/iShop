using System;
using Newtonsoft.Json;

namespace iShopAPI;

public class JSONSerializer
{
    public static object? Deserialize(TextReader reader, System.Type objectType)
    {
        var serializer = new JsonSerializer();
        object? deserializedObject = new object();
        try
        {
            deserializedObject = serializer.Deserialize(reader, objectType);
        }
        catch (Exception ex)
        {
            Console.WriteLine("JSON Deserialize Exception " + ex.Message);
        }
        return deserializedObject;
    }

    public static void Serialize(TextWriter writer, System.Type objectType)
    {
        var serializer = new JsonSerializer();
        serializer.Serialize(writer, objectType);
    }
}

public class JSONConvert
{
    private static readonly JsonSerializerSettings _options = new() { NullValueHandling = NullValueHandling.Ignore };

    JsonSerializerSettings settings = new JsonSerializerSettings
    {
        MissingMemberHandling = MissingMemberHandling.Ignore
    };

    public static string SerializeObject(object value)
    {
        return JsonConvert.SerializeObject(value, Formatting.Indented, _options);
    }

    public static T? DeserializeObject<T>(string json)
    {
        return JsonConvert.DeserializeObject<T>(json);
    }
}

