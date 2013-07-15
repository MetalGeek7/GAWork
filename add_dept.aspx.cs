using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_dept : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        populateMenu();
    }

    protected void populateMenu()
    {
        Connection cs = new Connection();
        HtmlMenu.Text = cs.AppMenu("syllabiApp");
    }

    protected void addDept(object sender, EventArgs e)
    {
        String q = "INSERT INTO syllabus.dbo.departmentDetails ([dept_name]) VALUES('" + dept_name.Text + "')";
        Connection cs = new Connection();
        cs.addSyllabiEntry(q);
        Response.Write("Department has been added");
    }
}
