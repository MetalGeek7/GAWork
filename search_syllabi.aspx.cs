using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class search_syllabi: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            populateSemesterDropdown();
            populateDropdown();
            populateDeptDropdown();
            populateCourseDropdown();
        }
    }

    protected void populateSemesterDropdown()
    {
        //semester.DataBind();
        semester.Items.Insert(0, new ListItem("Select Semester", "-1"));
        semester.Items.Insert(1, new ListItem("Fall", "Fall"));
        semester.Items.Insert(2, new ListItem("Spring", "Spring"));
        semester.Items.Insert(3, new ListItem("Summer", "Summer"));
        year.Items.Insert(0, new ListItem("Select Year", "-1"));
        year.Items.Insert(1, new ListItem("2012", "2012"));
        year.Items.Insert(2, new ListItem("2013", "2013"));
    }

    protected void populateDropdown()
    {

        Connection cs = new Connection();
        DataSet d = cs.DropdownData("select f_id,f_lastName+','+f_firstName AS name from facultyDetails ORDER BY f_lastName ASC");
        DD_Faculty_list.DataSource = d;
        DD_Faculty_list.DataTextField = d.Tables[0].Columns["name"].ToString();
        DD_Faculty_list.DataValueField = d.Tables[0].Columns["f_id"].ToString();
        DD_Faculty_list.DataBind();
        DD_Faculty_list.Items.Insert(0, new ListItem("Select Faculty", "-1"));
        DD_Faculty_list.SelectedIndex = 0;

    }


    protected void populateCourseDropdown()
    {
        Connection cs = new Connection();
        DataSet d = cs.DropdownData("select p_id,course_id+' , '+course_name as name from courseDetails ORDER BY course_id ASC");
        course_List.DataSource = d;
        course_List.DataTextField = d.Tables[0].Columns["name"].ToString();
        course_List.DataValueField = d.Tables[0].Columns["p_id"].ToString();
        course_List.DataBind();
        course_List.Items.Insert(0, new ListItem("Select Course", "-1"));
        course_List.SelectedIndex = 0;
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

    protected void searchByCRN(object sender, EventArgs e)
    {
        Connection condata = new Connection();
        DataSet gridData = condata.CrnData(tb1.Text, semester.SelectedValue, year.SelectedValue);
        GridView1.DataSource = gridData;
        GridView1.DataBind();
    }

    protected void searchByCourseName(object sender, EventArgs e)
    {
        Connection condata = new Connection();
        DataSet gridData = condata.byCourseName(courseName.Text, semester.SelectedValue, year.SelectedValue);
        GridView1.DataSource = gridData;
        GridView1.DataBind();
    }

    protected void SearchbyDeptName_Click(object sender, EventArgs e)
    {
        Connection condata = new Connection();
        DataSet gridData = condata.byDeptData(DD_Dept_list.SelectedValue, semester.SelectedValue, year.SelectedValue);
        GridView1.DataSource = gridData;
        GridView1.DataBind();
    }

    protected void SearchbyCourseID_Click(object sender, EventArgs e)
    {
        Connection condata = new Connection();
        DataSet gridData = condata.byCourseID(course_List.SelectedValue, semester.SelectedValue, year.SelectedValue);
        GridView1.DataSource = gridData;
        GridView1.DataBind();
    }

    protected void SearchbyFaculty_Click(object sender, EventArgs e)
    {
        Connection condata = new Connection();
        DataSet gridData = condata.byFacultyData(DD_Faculty_list.SelectedValue, semester.SelectedValue, year.SelectedValue);
        GridView1.DataSource = gridData;
        GridView1.DataBind();
    }

    protected void commonSearch(object sender, EventArgs e)
    {
        Connection condata = new Connection();
        DataSet gridData = condata.Search(tb1.Text,DD_Dept_list.SelectedValue,courseName.Text, course_List.SelectedValue,DD_Faculty_list.SelectedValue,semester.SelectedValue, year.SelectedValue);
        GridView1.DataSource = gridData;
        GridView1.DataBind();
    }
}

