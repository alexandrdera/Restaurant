using Restaurant._BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant._DAL
{
	public interface IRepository : IDisposable
	{
		#region System
		RestaurantContainer db { get; set;}
		void Save();
		#endregion

		#region Menu
		IQueryable<Menu> GetMenuItems();
		int SaveMenuItem(Menu item);
		bool DeleteMenuItem(int id);
		#endregion
	}
}
