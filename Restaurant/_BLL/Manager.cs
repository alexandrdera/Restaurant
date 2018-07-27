using Restaurant._DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Restaurant._BLL
{
	public class Manager : IManager
	{
		#region System
		private IRepository db { set; get; }
		public Manager(IRepository db)
		{
			this.db = db;
			_disposed = false;
		}
		private void Save()
		{
			db.Save();
		}
		private bool _disposed = false;
		public virtual void Dispose(bool disposing)
		{
			if (!this._disposed)
			{
				if (disposing)
				{
					db.Dispose();
				}
				this._disposed = true;
			}
		}
		public void Dispose()
		{
			Dispose(true);
			GC.SuppressFinalize(this);
		}
		#endregion

		#region Managers Core		
		private IManager _menu;
		public IManager Menu
		{
			get
			{
				if (_menu == null)
				{
					_menu = new Manager(db);
				}
				return _menu;
			}
			set
			{
				_menu = value;
			}
		}
		#endregion
	}
}	