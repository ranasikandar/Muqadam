using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Muqadam.AdminPanel
{
    public partial class Company : System.Web.UI.Page
    {
        private string con = System.Configuration.ConfigurationManager.ConnectionStrings["connectionstring"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            ////check if user is admin or not
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            ////check if user is admin or not


            if (!this.IsPostBack)
            {
                loadDgvSearch();
                this.lblMsg.Text = "Welcom into Company '" + Session["FullName"].ToString() + "'";
            }
        }

        private void loadDgvSearch()
        {
            this.dgvSearch.DataSource = new Database(con).ExecuteForDataSet("SELECT * FROM Company");
            dgvSearch.DataBind();

            getMaxUserId();
        }

        void getMaxUserId()
        {
            this.txtID.Text = Convert.ToString(Convert.ToInt32(new Database(con).getMax("CompanyID", "Company")) + 1);
        }

        protected void btnPostCancel_Click(object sender, EventArgs e)
        {
            getMaxUserId();
            this.txtCompanyName.Text = "";
            
            this.txtSearch.Text = "";
            this.HiddenFieldGridEdit.Value = "";
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            string query;
            try
            {
                if (!string.IsNullOrEmpty(this.HiddenFieldGridEdit.Value))
                {
                    if (CtrlValidation())
                    {
                        query = "update Company set CompanyName='" + this.txtCompanyName.Text + "' where CompanyID=" + txtID.Text + "";
                        new Database(con).ExecuteNonQueryOnly(query);

                        this.lblMsg.Text = "Updated!";
                        //Alert.Show("Updated!");

                        this.HiddenFieldGridEdit.Value = null;
                    }
                    else
                    {
                        return;
                    }


                }
                else
                {
                    if (CtrlValidation())
                    {
                        query = "insert into Company values (" + txtID.Text + ",'" + this.txtCompanyName.Text + "')";
                        new Database(con).ExecuteNonQueryOnly(query);

                        this.lblMsg.Text = "Saved!";
                        //Alert.Show("Updated!");

                        this.HiddenFieldGridEdit.Value = null;
                    }
                    else
                    {
                        return;
                    }
                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }

            loadDgvSearch();


            btnPostCancel_Click(sender, e);
        }

        private bool CtrlValidation()
        {
            if (this.txtCompanyName.Text.Trim() != "")
            {
                return true;
            }
            else
            {
                this.lblMsg.Text = "Please Enter Full Name";
                this.txtCompanyName.Focus();
            }

            return false;
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.dgvSearch.DataSource = new Database(con).ExecuteForDataSet("select * from Company where CompanyName like '%" + txtSearch.Text + "%' order by CompanyID asc");
            dgvSearch.DataBind();
        }

        protected void dgvSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "delindex")
            {
                try
                {
                    new Database(con).ExecuteNonQueryOnly("delete from Company where CompanyID='" + Convert.ToString(this.dgvSearch.DataKeys[Convert.ToInt32(e.CommandArgument)].Values[0]) + "'");

                    loadDgvSearch();

                    //Alert.Show("Deleted!");
                    this.lblMsg.Text = "Deleted!";
                    btnPostCancel_Click(sender, e);
                }
                catch (Exception ex)
                {
                    //Alert.Show(ex.Message);
                    this.lblMsg.Text = "UNABEL TO DELETE!";
                }

            }
            if (e.CommandName == "editx")
            {
                this.HiddenFieldGridEdit.Value = Convert.ToString(this.dgvSearch.DataKeys[Convert.ToInt32(e.CommandArgument)].Values[0]);

                System.Data.DataTable dt = new System.Data.DataTable();
                dt = new Database(con).ExecuteForDataTable("select * from Company Where CompanyID='" + this.HiddenFieldGridEdit.Value + "'");

                if (dt.Rows.Count > 0)
                {
                    this.txtID.Text = dt.Rows[0]["CompanyID"].ToString();
                    this.txtCompanyName.Text = dt.Rows[0]["CompanyName"].ToString();
                }
                else
                {
                    //Alert.Show("Nothing Found");
                    this.lblMsg.Text = "Nothing Found";
                }
            }
        }

        protected void dgvSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.dgvSearch.PageIndex = e.NewPageIndex;
            loadDgvSearch();
        }
    }
}