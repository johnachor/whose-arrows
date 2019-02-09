using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WhoseArrows.Models.Request
{
	public class NewPlayerRequest
	{
		public string Name { get; set; }
		public string FirebaseId { get; set; }
	}
}
