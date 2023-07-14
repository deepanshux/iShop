using System;

namespace iShopAPI.Repository;

public class ProductRepo
{
    public static List<Product> Get()
    {
        string json = File.ReadAllText(Global.productsFile);
        List<Product> products = new List<Product>();

        try
        {
            ProductResponse response = JSONConvert.DeserializeObject<ProductResponse>(json);
            products = response.products;
        }
        catch(Exception ex)
        {
            Console.WriteLine("Error while parsing the Products", ex.Message);
        }
        return products;
    }
}

