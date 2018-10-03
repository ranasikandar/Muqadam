using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
// Used for DataTable, SqlDataReader etc. objects
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Data.Odbc;
using System.Data.OleDb;

 public  class Database
    {
        private string ConnectionString = string.Empty;

        public Database(string cs)
        {
            ConnectionString = cs;
        }

        public void ExecuteNonQueryOnly(string strQry)
        {
            SqlConnection con = new SqlConnection();
            SqlCommand cmd;
            con.ConnectionString = ConnectionString;
            try
            {
                con.Open();
                cmd = new SqlCommand(strQry);
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                //string output;
                //output = ex.Message.ToString();
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        public void ExecuteNonQueryOnly(string proName, SqlParameter[] par)
        {
            SqlConnection con = new SqlConnection();
            SqlCommand cmd;
            con.ConnectionString = ConnectionString;
            try
            {
                con.Open();
                cmd = new SqlCommand(proName);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddRange(par);
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
            }

            catch (Exception ex)
            {
                //string output;
                //output = ex.Message.ToString();
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        public void ExecuteNonQueryOnly(string Qry, SqlParameter param)
        {
            SqlConnection con = new SqlConnection();
            SqlCommand cmd;
            con.ConnectionString = ConnectionString;
            try
            {
                con.Open();
                cmd = new SqlCommand(Qry);
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add(param);
                cmd.ExecuteNonQuery();
            }

            catch (Exception ex)
            {
                //string output;
                //output = ex.Message.ToString();
                throw ex;
            }
            finally
            {
                con.Close();
            }

        }
        public bool ExecuteNonQueryOnly(string proName, System.Collections.Specialized.ListDictionary Parameters)
        {
            SqlConnection con = new SqlConnection();
            SqlCommand cmd;
            con.ConnectionString = ConnectionString;
            try
            {
                con.Open();
                cmd = new SqlCommand(proName);
                cmd.CommandType = CommandType.StoredProcedure;
                IDataParameter p;
                if (Parameters != null)
                {
                    foreach (System.Collections.DictionaryEntry param in Parameters)
                    {
                        p = param.Key as IDataParameter;
                        if (null == p)
                        {
                            p.ParameterName = (string)param.Key;
                            p.Value = param.Value;
                        }
                        else
                        {
                            p.Value = param.Value;
                        }
                        cmd.Parameters.Add(p);
                    }
                }
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                con.Close();
                return true;
            }
            catch (Exception ex)
            {
                //ex.Message.ToString();                                
                throw ex;
                
            }
            finally
            {
                con.Close();
                //return false;
            }
        }
        public Object ExecuteScalerOnly(string strQuery)
        {
            SqlConnection con = new SqlConnection();
            SqlCommand cmd;
            con.ConnectionString = ConnectionString;
            object id = null;
            try
            {
                con.Open();
                cmd = new SqlCommand(strQuery);
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                id = cmd.ExecuteScalar();
            }

            catch (Exception ex)
            {
                //string output;
                //output = ex.Message.ToString();
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return id;

        }
        public DataSet ExecuteForDataSet(string strQuery)
        {
            SqlConnection con = new SqlConnection();
            SqlDataAdapter myAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            SqlCommand cmd;
            con.ConnectionString = ConnectionString;            
            try
            {
                con.Open();
                cmd = new SqlCommand(strQuery);
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandTimeout = 10000;
                myAdapter.SelectCommand = cmd;
                myAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                //string output;
                //output = ex.Message.ToString();
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return ds;
        }
        public DataRow ExecuteForDataRow(string strQuery)
        {
            SqlConnection con = new SqlConnection();
            SqlDataAdapter myAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            SqlCommand cmd;
            DataRow myDataRow;//= new DataRow() ;
            con.ConnectionString = ConnectionString;
            try
            {
                con.Open();
                cmd = new SqlCommand(strQuery);
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                myAdapter.SelectCommand = cmd;
                myAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                //string output;
                //output = ex.Message.ToString();
                throw ex;
            }
            finally
            {
                con.Close();
            }
            if (ds.Tables[0] != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                    myDataRow = ds.Tables[0].Rows[0];
                else
                    myDataRow = null;
            }
            else
                myDataRow = null;
            return myDataRow;
        }
        public SqlDataReader ExecuteForDataReader(string strQuery)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConnectionString;
            SqlDataReader myDataReader = null;
            SqlCommand cmd;
            try
            {
                con.Open();
                cmd = new SqlCommand(strQuery);
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                myDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            }
            catch (Exception ex)
            {
                //string output;
                //output = ex.Message.ToString();
                throw ex;
            }
            //con.Close();
            return myDataReader;
        }
        public DataSet ExcellExecuteForDataSet(string strQuery, string DirPath)
        {
            OleDbConnection con = new OleDbConnection();
            OleDbDataAdapter myAdapter = new OleDbDataAdapter();
            DataSet ds = new DataSet();
            OleDbCommand cmd;
            con.ConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 12.0 Xml;HDR=YES'", DirPath);
            try
            {
                con.Open();
                cmd = new OleDbCommand(strQuery);
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                myAdapter.SelectCommand = cmd;
                myAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                //string output;
                //output = ex.Message.ToString();
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return ds;
        }
        public DataTable ExcellExecuteForDataTable(string strQuery, string DirPath)
        {
            OleDbConnection con = new OleDbConnection();
            OleDbDataAdapter myAdapter = new OleDbDataAdapter();
            DataTable dt = new DataTable();
            OleDbCommand cmd;
            con.ConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 12.0 Xml;HDR=YES'", DirPath);
            try
            {
                con.Open();
                cmd = new OleDbCommand(strQuery);
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                myAdapter.SelectCommand = cmd;
                myAdapter.Fill(dt);
            }
            catch (Exception ex)
            {
                //string output;
                //output = ex.Message.ToString();
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return dt;
        }

        private string procedureName;
        private SqlCommand thisCommand;
        public string ProcName
        {
            set { procedureName = value; }
        }
        public void CreateProcedureCommand()
        {
            thisCommand = new SqlCommand(procedureName);
            thisCommand.CommandType = CommandType.StoredProcedure;
        }
        public int Execute()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConnectionString;
            try
            {
                con.Open();
                thisCommand.Connection = con;
                int nRecordEffected = (int)thisCommand.ExecuteNonQuery();
                con.Close();
                return nRecordEffected;
            }
            catch (Exception ex)
            {
                //ex.Message.ToString();
                throw ex;                
            }
            finally
            {
                con.Close();
            }
        }
        public DataTable ExecuteReturnDataTable()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConnectionString;
            try
            {
                con.Open();
                thisCommand.Connection = con;
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(thisCommand);
                da.Fill(ds);
                DataTable dt = null;
                if (ds.Tables.Count != 0)
                    dt = ds.Tables[0];
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                //ex.Message.ToString();
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }


        public DataTable ExecuteForDataTable(string strQuery)
        {
            SqlConnection con = new SqlConnection();
            SqlCommand cmd;
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            con.ConnectionString = ConnectionString;
            try
            {
                con.Open();
                cmd = new SqlCommand(strQuery, con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                con.Close();
            }
        }



        // ========== Procedure Parameters ==========
        public string Parameters()
        {
            return thisCommand.Parameters["@RetVal"].Value.ToString();
        }
        public void Parameters(string name, SqlDbType type, int size, string val)
        {
            thisCommand.Parameters.Add(name, type, size);
            thisCommand.Parameters[name].Value = val;
        }
        public void Parameters(string name, SqlDbType type, int size, bool val)
        {
            thisCommand.Parameters.Add(name, type, size);
            thisCommand.Parameters[name].Value = val;
        }
        public void Parameters(string name, SqlDbType type, int size)
        {
            thisCommand.Parameters.Add(name, type, size);
            thisCommand.Parameters[name].Direction = ParameterDirection.Output;
        }
        public void Parameters(string name, SqlDbType type, int size, double val)
        {
            thisCommand.Parameters.Add(name, type, size);
            thisCommand.Parameters[name].Value = val;
        }
        public void Parameters(string name, SqlDbType type, int size, int val)
        {
            thisCommand.Parameters.Add(name, type, size);
            thisCommand.Parameters[name].Value = val;
        }
        public void Parameters(string name, SqlDbType type, int size, DateTime val)
        {
            thisCommand.Parameters.Add(name, type, size);
            thisCommand.Parameters[name].Value = val;
        }
        public void Parameters(string name, SqlDbType type, byte[] val)
        {
            thisCommand.Parameters.Add(name, type);
            thisCommand.Parameters[name].Value = val;
        }



        public int getMax(string row, string fromTbl)
        {
            string query = string.Format(@"SELECT COALESCE (MAX({0}), 0) AS maxID
                    FROM {1}",row,fromTbl);
            try
            {
                DataSet ds = ExecuteForDataSet(query);
                return Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }

        public string GetCellFromTbl(string fromTbl, string where)
        {
            string query = string.Format(@"select Description from {0} where {1}", fromTbl, where);
            try
            {
                DataSet ds = ExecuteForDataSet(query);
                return Convert.ToString(ds.Tables[0].Rows[0][0]);
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }


    }

