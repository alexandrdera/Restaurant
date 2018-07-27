using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant._BLL
{
	public interface IManager : IDisposable
	{
		#region Managers Core
		IManager Menu { get; set; }
		#endregion
	}
}
