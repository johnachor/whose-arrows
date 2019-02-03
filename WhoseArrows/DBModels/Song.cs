using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WhoseArrows.DBModels
{
	public class Song
	{
		public long Id { get; set; }
		public long FirstAppeared { get; set; }
		public string Title { get; set; }
		public string TitleRomanized { get; set; }
		public string Artist { get; set; }
		public string ArtistRomanized { get; set; }
	}
}
