using Restaurant._DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Restaurant._BLL.Core
{
	public class MenuManager
	{
		#region System
		public IRepository db;
		public IManager mng;
		private bool _disposed;

		public MenuManager(IRepository db, IManager mng)
		{
			this.db = db;
			this.mng = mng;
			_disposed = false;
		}

		public void Dispose()
		{
			Dispose(true);
			GC.SuppressFinalize(this);
		}
		protected virtual void Dispose(bool disposing)
		{
			if (!_disposed)
			{
				if (disposing)
				{

				}
				_disposed = true;
			}
		}
		#endregion

		public Menu GetMenu()
		{
			var res = new Menu();
			res = db.GetMenuItems().FirstOrDefault();
			return res;
		}
	}
}