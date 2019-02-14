using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WhoseArrows.Models.Response
{
	public class SessionScore
	{
		public long SessionId { get; set; }
		public string Name { get; set; }
		public int Score { get; set; }
	}
}
