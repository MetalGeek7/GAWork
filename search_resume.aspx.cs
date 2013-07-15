using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class search_resume : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            populateDeptDropdown();
            populateFacultyDropDown();
        }
    }

    protected void populateDeptDropdown()
    {

        Connection cs = new Connection();
        DataSet d = cs.DeptDropdownData();
        DD_Dept_list.DataSource = d;
        DD_Dept_list.DataTextField = d.Tables[0].Columns["dept_name"].ToString();
        DD_Dept_list.DataValueField = d.Tables[0].Columns["dept_id"].ToString();
        DD_Dept_list.DataBind();
        DD_Dept_list.Items.Insert(0,new ListItem("Select Department" , "-1"));
        DD_Dept_list.Items.Insert(1, new ListItem("All Departments", "0"));
        DD_Dept_list.SelectedIndex = 0;

    }
  
    protected void populateFacultyDropDown()
    {
        Connection cs = new Connection();
        DataSet d = cs.DropdownData("select f_id,f_lastName+' , '+f_firstName as name from facultyDetails ORDER BY f_lastName ASC");
        facultyDropDownList.DataSource = d;
        facultyDropDownList.DataTextField = d.Tables[0].Columns["name"].ToString();
        facultyDropDownList.DataValueField = d.Tables[0].Columns["f_id"].ToString();
        facultyDropDownList.DataBind();
        facultyDropDownList.Items.Insert(0,new ListItem("Select Faculty" , "-1"));
        facultyDropDownList.SelectedIndex = facultyDropDownList.SelectedIndex;
    }

    protected void searchByFacultyFunc(object sender,EventArgs e)
    {
        Connection condata = new Connection();
        String q = "SELECT departmentDetails.dept_name, faculty_Resume.resume_path, facultyDetails.f_firstName, facultyDetails.f_lastName FROM departmentDetails INNER JOIN facultyDetails ON departmentDetails.dept_id = facultyDetails.dept_id INNER JOIN faculty_Resume ON facultyDetails.f_id = faculty_Resume.f_id where facultyDetails.f_id='" + facultyDropDownList.SelectedValue + "' ORDER BY f_firstName ASC";
        DataSet gridData = condata.ForResume(q);
        GridView1.DataSource = gridData;
        GridView1.DataBind();

    }

    protected void searchByDeptFunc(object sender, EventArgs e)
    {
        Connection condata = new Connection();
        String q = null;
        if (DD_Dept_list.SelectedValue.Equals("0"))
        {
            q = "SELECT departmentDetails.dept_name, faculty_Resume.resume_path, facultyDetails.f_firstName, facultyDetails.f_lastName FROM departmentDetails INNER JOIN facultyDetails ON departmentDetails.dept_id = facultyDetails.dept_id INNER JOIN faculty_Resume ON facultyDetails.f_id = faculty_Resume.f_id ORDER BY f_firstName ASC";
        }
        else
        {
            q = "SELECT departmentDetails.dept_name, faculty_Resume.resume_path, facultyDetails.f_firstName, facultyDetails.f_lastName FROM departmentDetails INNER JOIN facultyDetails ON departmentDetails.dept_id = facultyDetails.dept_id INNER JOIN faculty_Resume ON facultyDetails.f_id = faculty_Resume.f_id where departmentDetails.dept_id='" + DD_Dept_list.SelectedValue + "' ORDER BY f_firstName ASC";
        }
        DataSet gridData = condata.ForResume(q);
        GridView1.DataSource = gridData;
        GridView1.DataBind();
    }
}
