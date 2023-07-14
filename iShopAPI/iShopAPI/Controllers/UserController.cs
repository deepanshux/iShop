using System;
using Microsoft.AspNetCore.Mvc;

namespace iShopAPI.Controllers;

[ApiController]
[Route("[controller]")]
public class UserController : ControllerBase
{
    private readonly UserService userService = new UserService();

    [HttpGet]
    public IEnumerable<User> Get()
    {
        return userService.GetUsers();
    }

    [HttpGet("{id}")]
    public IActionResult GetUserById([FromRoute] string id)
    {
        var user = userService.GetUserById(id);
        return user == null ? NotFound() : Ok(user);
    }

    //[HttpGet]
    //public User Get(string email, string password)
    //{
    //    return userService.GetUser(email, password);
    //}

    [HttpPost]
    public void AddUser([FromBody] User user)
    {
        userService.AddUser(user);
    }

}

