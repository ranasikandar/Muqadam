using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Muqadam.AdminPanel
{
    public partial class Product : System.Web.UI.Page
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

                try
                {
                    this.cbxCompany.DataSource = new Database(con).ExecuteForDataTable("select distinct pro.CompanyID,com.CompanyName from Product pro inner join Company com on pro.CompanyID=com.CompanyID");
                    cbxCompany.DataBind();

                    this.lblMsg.Text = "Welcom into Product '" + Session["FullName"].ToString() + "'";
                }
                catch (Exception)
                {
                }
            }
        }

        private void loadDgvSearch()
        {
            this.dgvSearch.DataSource = new Database(con).ExecuteForDataSet("SELECT * FROM Product");
            dgvSearch.DataBind();

            getMaxProId();
        }

        void getMaxProId()
        {
            this.txtID.Text = Convert.ToString(Convert.ToInt32(new Database(con).getMax("ProductID", "Product")) + 1);
        }

        protected void btnPostCancel_Click(object sender, EventArgs e)
        {
            getMaxProId();

            this.txtProductName.Text = "";
            this.txtCurrentStock.Text = "";
            this.cbxCompany.SelectedIndex=0;

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
                        query = "update Product set ProductName='" + this.txtProductName.Text + "',CurrentStock='" + this.txtCurrentStock.Text + "',CompanyID='" + this.cbxCompany.SelectedValue + "' where ProductID=" + this.txtID.Text + "";
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
                        query = "insert into Product values (" + txtID.Text + ",'" + txtProductName.Text + "','" + txtCurrentStock.Text + "','" + cbxCompany.SelectedValue + "')";
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
            if (this.txtProductName.Text.Trim() != "")
            {
                if (this.txtCurrentStock.Text.Trim() != "")
                {
                    if (this.cbxCompany.SelectedIndex<0)
                    {
                        return true;
                    }
                    else
                    {
                        this.lblMsg.Text = "Please Select Company";
                        this.cbxCompany.Focus();
                    }
                }
                else
                {
                    this.lblMsg.Text = "Please Enter Current Stock";
                    this.txtCurrentStock.Focus();
                }
            }
            else
            {
                this.lblMsg.Text = "Please Enter Product Name";
                this.txtProductName.Focus();
            }

            return false;
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.dgvSearch.DataSource = new Database(con).ExecuteForDataSet("select * from Product where ProductName like '%" + txtSearch.Text + "%' order by ProductID asc");
            dgvSearch.DataBind();

            btnPostCancel_Click(sender, e);
        }

        protected void dgvSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "delindex")
            {
                try
                {
                    new Database(con).ExecuteNonQueryOnly("delete from Product where ProductID='" + Convert.ToString(this.dgvSearch.DataKeys[Convert.ToInt32(e.CommandArgument)].Values[0]) + "'");

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
                dt = new Database(con).ExecuteForDataTable("select * from Product Where ProductID='" + this.HiddenFieldGridEdit.Value + "'");

                if (dt.Rows.Count > 0)
                {
                    this.txtID.Text = dt.Rows[0]["ProductID"].ToString();
                    this.txtProductName.Text = dt.Rows[0]["ProductName"].ToString();
                    this.txtCurrentStock.Text = dt.Rows[0]["CurrentStock"].ToString();
                    this.cbxCompany.SelectedValue = dt.Rows[0]["CompanyID"].ToString();
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