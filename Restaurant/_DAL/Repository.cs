using Restaurant._BLL;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Restaurant._DAL
{
	public class Repository : IRepository
	{
		#region System
		private RestaurantContainer _db;
		private bool _disposed;
		public RestaurantContainer db
		{
			get
			{
				if (_db == null)
				{
					_db = new RestaurantContainer();
				}
				return _db;
			}
			set
			{
				_db = value;
			}
		}
		public Repository(RestaurantContainer db)
		{
			if (db == null) this.db = new RestaurantContainer();
			_disposed = false;
			//SERIALIZE WILL FAIL WITH PROXIED ENTITIES
			//dbContext.Configuration.ProxyCreationEnabled = false;
			//ENABLING COULD CAUSE ENDLESS LOOPS AND PERFORMANCE PROBLEMS
			//dbContext.Configuration.LazyLoadingEnabled = false;
		}
		public void Dispose() {
			Dispose(true);
			GC.SuppressFinalize(this);	
		}
		protected virtual void Dispose(bool disposing)
		{
			if (!_disposed)
			{
				if (disposing)
				{
					if (db != null) db.Dispose();
				}
				db = null;
				_disposed = true;
			}
		}
		public void Save()
		{
			db.SaveChanges();
		}
		#endregion

		#region Menu
		public IQueryable<Menu> GetMenuItems()
		{
			var res = db.MenuSet;
			return res;
		}
		public int SaveMenuItem(Menu item)
		{
			if (item.Id == 0)
			{
				db.MenuSet.Add(item);
				db.SaveChanges();
			}
			else
			{
				db.Entry(item).State = EntityState.Modified;
				db.SaveChanges();
			}
			return item.Id;
		}
		public bool DeleteMenuItem(int id)
		{
			bool res = false;
			var item = db.MenuSet.SingleOrDefault(x => x.Id == id);
			if (item != null)
			{
				db.Entry(item).State = EntityState.Deleted;
				db.SaveChanges();
			}
			res = true;
			return res;
		}
		#endregion
	}
}