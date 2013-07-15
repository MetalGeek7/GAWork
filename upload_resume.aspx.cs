using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class upload_resume : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        populateMenu();
        
        if (!IsPostBack)
        {
            populateDeptDropdown();
            populateFacultyDropDown_d();
        }

    }

    protected void populateMenu()
    {
        Connection cs = new Connection();
        HtmlMenu.Text = cs.AppMenu("resumeApp");
    }

    protected void populateDeptDropdown()
    {

        Connection cs = new Connection();
        DataSet d = cs.DeptDropdownData();
        DD_Dept_list.DataSource = d;
        DD_Dept_list.DataTextField = d.Tables[0].Columns["dept_name"].ToString();
        DD_Dept_list.DataValueField = d.Tables[0].Columns["dept_id"].ToString();
        DD_Dept_list.DataBind();
        DD_Dept_list.Items.Insert(0, new ListItem("Select Department", "-1"));
        DD_Dept_list.SelectedIndex = 0;

    }

    protected void populateFacultyDropDown(object sender, EventArgs e)
    {
        populateFacultyDropDown_d();
    }

    protected void populateFacultyDropDown_d()
    {
        Connection cs = new Connection();
        DataSet d = cs.DropdownData("select f_id,f_firstName+' , '+f_lastName as name from facultyDetails where dept_id=" + DD_Dept_list.SelectedValue);
        facultyDropDownList.DataSource = d;
        facultyDropDownList.DataTextField = d.Tables[0].Columns["name"].ToString();
        facultyDropDownList.DataValueField = d.Tables[0].Columns["f_id"].ToString();
        facultyDropDownList.DataBind();
        facultyDropDownList.Items.Insert(0, new ListItem("Select Faculty", "-1"));
        facultyDropDownList.SelectedIndex = facultyDropDownList.SelectedIndex;
    }

    protected void UploadResumeFunc(object sender, EventArgs e)
    {
        if ((resumeUploadOption.PostedFile != null) && (resumeUploadOption.PostedFile.ContentLength > 0))
        {

            string fn = facultyDropDownList.SelectedValue + "_resume_" + resumeUploadOption.FileName;
            string SaveLocation = Server.MapPath("cvs") + "\\" + fn;
            try
            {
                String q = "INSERT INTO syllabus.dbo.faculty_Resume([f_id],[resume_path]) VALUES (" + facultyDropDownList.SelectedValue + ",'cvs/" + fn + "')";

                resumeUploadOption.SaveAs(SaveLocation);
                Connection cs = new Connection();
                cs.addSyllabiEntry(q);
                Response.Write("The file has been uploaded.");
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
        else
        {
            Response.Write("Please select a file to upload.");
        }
    }

}
