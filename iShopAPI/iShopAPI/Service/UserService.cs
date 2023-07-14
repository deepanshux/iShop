using System;
namespace iShopAPI
{
	public class UserService
	{
		public UserService()
		{
		}

        private static readonly User[] users = new User[]
		{
			new User { id = 1,name = "Deepanshu jain", password = "1234",email = "deepanshu@gmail.com"},
            new User { id = 2,name = "Amit", password = "abcd",email = "amit@gmail.com"},
            new User { id = 3,name = "Namit", password = "12ab",email = "namit@gmail.com"}
        };

		public IEnumerable<User> GetUsers()
		{
			return users.ToList();
		}

		public void AddUser(User user)
		{

		}

		public User GetUserById(string id)
		{
            User user = users.FirstOrDefault(u => u.id == int.Parse(id));
			return user;
        }

        public User GetUser(string email, string password)
        {
			return filterUser(email, password);
		}

		private User filterUser(string email, string password)
		{
			User user = (User)users.Where(u =>
				u.email == email && u.password == password
			);
			return user;
		}
    }
}

