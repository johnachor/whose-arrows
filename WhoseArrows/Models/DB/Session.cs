using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WhoseArrows.Models.DB
{
	public class Session
	{
		public long Id { get; set; }
		public Guid SessionId { get; set; }
		public int SessionLength { get; set; }
		public long? PlayerId { get; set; }
		public string AnonPlayerName { get; set; }
	}
}
