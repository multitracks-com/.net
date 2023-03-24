using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace MTDataAccess
{
    public class Parameters
	{
		public List<SqlParameter> List = new List<SqlParameter>();

        public Parameters()
        {
        }

		public SqlParameter this[string parameterName]
		{
			get
			{
				foreach (SqlParameter param in List)
				{
					if (param.ParameterName == parameterName)
						return param;
				}
				return null;
			}
		}

		public SqlParameter this[int parameterIndex]
		{
			get
			{
				return List[parameterIndex];
			}
		}

		public void Clear()
		{
			List.Clear();
		}

		public void Add(SqlParameter parameter)
		{
			List.Add(parameter);
		}

		public void Add(string parameterName, SqlDbType type, ParameterDirection direction)
		{
			SqlParameter param = new SqlParameter(parameterName, type);
			param.SqlDbType = type;
			param.Direction = direction;
			List.Add(param);
		}


		public void Add(string parameterName, SqlDbType type, object value, byte precision, int size, ParameterDirection direction)
		{
			SqlParameter param = new SqlParameter(parameterName, type);
			param.SqlDbType = type;
			param.Value = value;
			param.Precision = precision;
			param.Size = size;
			param.Direction = direction;
			List.Add(param);
		}

		public void Add(string parameterName, SqlDbType type, object value, byte precision, int size)
		{
			SqlParameter param = new SqlParameter(parameterName, type);
			param.SqlDbType = type;
			param.Value = value;
			param.Precision = precision;
			param.Size = size;
			List.Add(param);
		}

		public void Add(string parameterName, SqlDbType type, object value, byte precision)
		{
			SqlParameter param = new SqlParameter(parameterName, type);
			param.SqlDbType = type;
			param.Value = value;
			param.Precision = precision;
			List.Add(param);
		}

		public void Add(string parameterName, SqlDbType type, byte precision)
		{
			SqlParameter param = new SqlParameter(parameterName, type);
			param.SqlDbType = type;
			param.Precision = precision;
			List.Add(param);
		}


		public void Add(string parameterName, SqlDbType type, object value)
		{
			SqlParameter param = new SqlParameter(parameterName, type);
			param.SqlDbType = type;
			param.Value = value;
			List.Add(param);
		}

		public void Add(string parameterName, object value)
		{
			SqlParameter param = new SqlParameter(parameterName, value);
			List.Add(param);
		}

		public void Add(string parameterName, SqlDbType type)
		{
			SqlParameter param = new SqlParameter(parameterName, type);
			param.SqlDbType = type;
			List.Add(param);
		}


	}
}
