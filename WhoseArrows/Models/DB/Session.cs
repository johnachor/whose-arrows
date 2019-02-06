using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WhoseArrows.Models.DB
{
	public class Session
	{
		public long SessionId { get; set; }
		public Guid SessionGuid { get; set; }
		public int SessionLength { get; set; }
		public long? PlayerId { get; set; }
		public string AnonPlayerName { get; set; }
	}
}
