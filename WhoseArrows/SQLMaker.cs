using Microsoft.Extensions.Configuration;
using System.Data.SqlClient;

namespace WhoseArrows
{
	public static class SQLConnectionFactory
	{
		public static string _connectionString { get; private set; }

		public static void SetConnectionString (string connectionString)
		{
			_connectionString = connectionString;
		}

		public static SqlConnection New()
		{
			return new SqlConnection(_connectionString);
		}
	}
}