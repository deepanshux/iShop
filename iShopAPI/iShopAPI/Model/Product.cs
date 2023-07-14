using System;
namespace iShopAPI
{
	public class Product
	{
        public int id { set; get; } 
        public string? title { set; get; }
        public string? description { set; get; }
        public string? image { set; get; }
        public double price { set; get; }
        public string? category { set; get; }
    }

    public class ProductResponse
    {
        public List<Product>? products { set; get; }
    }
}

