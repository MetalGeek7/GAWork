﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class add_course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        populateMenu();
        if (!IsPostBack) {
            populateDeptDropdown();
        }
    }

    protected void populateMenu()
    {
        Connection cs = new Connection();
        HtmlMenu.Text = cs.AppMenu("syllabiApp");
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

    protected void addCourse(object sender, EventArgs e)
    {
        String q = "INSERT INTO syllabus.dbo.courseDetails ([course_id],[course_name],[dept_id]) VALUES('" + course_id.Text + "','" + course_name.Text + "'," + DD_Dept_list.SelectedValue + ")";
        Connection cs = new Connection();
        cs.addSyllabiEntry(q);
        Response.Write("Course has been added");
    }
}
