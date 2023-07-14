using System;
using Microsoft.AspNetCore.Mvc;

namespace iShopAPI.Controllers;

[ApiController]
[Route("[controller]")]
public class ProductController
{
    private readonly ProductService productService = new ProductService();

    [HttpGet]
    public IEnumerable<Product> Get()
    {
        return productService.GetProducts();
    }
}

