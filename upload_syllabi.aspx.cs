using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class upload_syllabi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        populateMenu();
        if (!IsPostBack)
        {
            populateDeptDropdown();
            populateFacultyDropDown();
        }
    }

    protected void populateMenu()
    {
        Connection cs = new Connection();
        HtmlMenu.Text = cs.AppMenu("syllabiApp");
    }

    protected void populateDropDowns(object sender, EventArgs e)
    {
        populateCourseDropdown();
        
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

    protected void populateCourseDropdown()
    {
        Connection cs = new Connection();
        DataSet d = cs.DropdownData("select p_id,course_id+' , '+course_name as name from courseDetails where dept_id=" + DD_Dept_list.SelectedValue + "ORDER BY course_id ASC");
        course_name.DataSource = d;
        course_name.DataTextField = d.Tables[0].Columns["name"].ToString();
        course_name.DataValueField = d.Tables[0].Columns["p_id"].ToString();
        course_name.DataBind();
        course_name.Items.Insert(0, new ListItem("Select Course", "-1"));
        course_name.SelectedIndex = course_name.SelectedIndex;
    }

    protected void populateFacultyDropDown()
    {
        Connection cs = new Connection();
        DataSet d = cs.DropdownData("select f_id,f_lastName+' , '+f_firstName as name from facultyDetails ORDER BY f_lastName");
        facultyDropDownList.DataSource = d;
        facultyDropDownList.DataTextField = d.Tables[0].Columns["name"].ToString();
        facultyDropDownList.DataValueField = d.Tables[0].Columns["f_id"].ToString();
        facultyDropDownList.DataBind();
        facultyDropDownList.Items.Insert(0, new ListItem("Select Faculty", "-1"));
        facultyDropDownList.SelectedIndex = facultyDropDownList.SelectedIndex;
    }


    protected void uploadSyllabifunc(object sender, EventArgs e)
    {
        if ((syllabi.PostedFile != null) && (syllabi.PostedFile.ContentLength > 0))
        {
            char[] separator = new char[] {','};  
            string[] sectionList = section.Text.Split(separator);

            foreach (String crn in sectionList)
            {
                String crnTrimmed = crn.Trim();
                string fn = crn + "_" + semester.Value + year.Value + "_" + syllabi.FileName;
                string SaveLocation = Server.MapPath("syllabus") + "\\" + fn;
                try
                {
                    String q_1 = "INSERT INTO syllabus.dbo.sectionDetails([p_id],[f_id],[crn]) VALUES (" + course_name.SelectedValue + "," + facultyDropDownList.SelectedValue + "," + crn + ")";
                    String q_sub = "select sec_id from syllabus.dbo.sectionDetails where crn=" + crn;
                    String q_2 = "INSERT INTO syllabus.dbo.syllabiPathDetails([s_path],[p_id],[sec_id],[semester],[year]) VALUES ('syllabus/" + fn + "' ," + course_name.SelectedValue + ",(" + q_sub + ") ,'" + semester.Value + "'," + year.Value + ")";

                    syllabi.SaveAs(SaveLocation);
                    Connection cs = new Connection();
                    cs.addSyllabiEntry(q_1);
                    cs.addSyllabiEntry(q_2);
                    Response.Write("The file has been uploaded.");
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }
        else
        {
            Response.Write("Please select a file to upload.");
        }
    }
}
