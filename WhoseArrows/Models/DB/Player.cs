using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WhoseArrows.Models.DB
{
	public class Player
	{
		public long Id { get; set; }
		public string Name { get; set; }
		public string FirebaseId { get; set; }
		public bool IsAdmin { get; set; }
	}
}
