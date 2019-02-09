using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WhoseArrows.Models.Response
{
	public class HighScore
	{
		public string PlayerName { get; set; }
		public int SessionLength { get; set; }
		public int Score { get; set; }
	}
}
