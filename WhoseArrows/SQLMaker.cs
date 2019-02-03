using Microsoft.Extensions.Configuration;
using System.Data.SqlClient;

namespace WhoseArrows
{
	public class SQLMaker
	{
		private string _connectionString;

		public SQLMaker(string connectionString)
		{
			_connectionString = connectionString;
		}

		public SqlConnection New()
		{
			return new SqlConnection(_connectionString);
		}
	}
}