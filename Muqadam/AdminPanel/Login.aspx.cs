using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Muqadam.AdminPanel
{
    public partial class Login : System.Web.UI.Page
    {
        private string con = System.Configuration.ConfigurationManager.ConnectionStrings["connectionstring"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["LogOut"] == "1")
            {
                Session.Abandon();
            }
            if (Session["UserID"]!=null&&!string.IsNullOrEmpty(Session["UserID"].ToString()))
            {
                Response.Redirect("Users.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtUserName.Text.Trim() != "" && txtPassword.Text.Trim() != "")
            {
                string sql = string.Format(@"SELECT * FROM Users
                                where UserName='{0}'
                                and Password='{1}'"
                                    , txtUserName.Text
                                    , txtPassword.Text);//Encryption.Encrypt(txtPassword.Text.Trim())


                try
                {
                    DataTable dt = new DataTable();
                    dt = new Database(con).ExecuteForDataTable(sql);

                    if (dt.Rows.Count > 0)
                    {
                        Session["UserID"] = dt.Rows[0]["UserID"];
                        Session["UserName"] = dt.Rows[0]["UserName"];
                        Session["FullName"] = dt.Rows[0]["FullName"];

                        Response.Redirect("Users.aspx");
                    }
                    else
                    {
                        //lblMsg.Text = "Sorry Invalid UserName Or Password.";
                        Alert.Show("Sorry Invalid UserName Or Password.");
                    }
                }
                catch (Exception ex)
                {

                    Response.Write(ex.Message);
                }
            }
            else
            {
                //lblMsg.Text = "UserName and Password Shouldn't be empty";
                Alert.Show("UserName and Password Shouldn't be empty");
            }
        }
    }
}