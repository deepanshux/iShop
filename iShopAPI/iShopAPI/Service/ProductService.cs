using System;
using iShopAPI.Repository;

namespace iShopAPI
{
	public class ProductService
	{
		public ProductService()
		{
		}

        public IEnumerable<Product> GetProducts()
        {
            return GetProductsFromRepo();
        }

        private List<Product> GetProductsFromRepo()
        {
            List<Product> products = ProductRepo.Get();
            return products;
        }
    }
}

