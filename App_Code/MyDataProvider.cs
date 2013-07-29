using System;
using System.Collections.Generic;

using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Connection
/// </summary>
public class Connection
{
    private String connStr;
    SqlConnection conn;
    SqlCommand comm;

    public Connection()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public String AppMenu(String appName)
    {
        String returnText = null;
        if(appName.Equals("resumeApp"))
        {
            returnText = "<a href='add_faculty.aspx'>Add Faculty</a>&nbsp;&nbsp;&nbsp;<a href='upload_resume.aspx'>Upload CV</a>";
        }
        else if (appName.Equals("syllabiApp"))
        {
            returnText = "<a href='add_dept.aspx'>Add Department</a><a href='add_course.aspx'>Add Course</a><a href='upload_syllabi.aspx'>Upload Syllabi</a>";
        }
        return returnText;

    }

    public DataSet DropdownData(String query_string)
    {
        connStr = ConfigurationManager.ConnectionStrings["cba_webappConnectionString1"].ToString();
        conn = new SqlConnection(connStr);
        
        comm = new SqlCommand(query_string, conn);
        
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(comm);
        DataSet ds = new DataSet();

        da.Fill(ds);
        if (conn.State.ToString() == "Open")
        {

            conn.Close();

        }
        return ds;
    }

    public DataSet DeptDropdownData()
    {
        connStr = ConfigurationManager.ConnectionStrings["cba_webappConnectionString1"].ToString();
        conn = new SqlConnection(connStr);
        comm = new SqlCommand("select dept_id,dept_name from departmentDetails", conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(comm);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (conn.State.ToString() == "Open")
        {
            conn.Close();
        }
        return ds;
    }

    public DataSet CrnData(String str, String sem, String year)
    {
        connStr = ConfigurationManager.ConnectionStrings["cba_webappConnectionString1"].ToString();
        conn = new SqlConnection(connStr);
        comm = new SqlCommand("SELECT departmentDetails.dept_name, sectionDetails.crn, facultyDetails.f_firstName, facultyDetails.f_lastName, syllabiPathDetails.s_path, courseDetails.course_id, courseDetails.course_name FROM courseDetails INNER JOIN departmentDetails ON courseDetails.dept_id = departmentDetails.dept_id INNER JOIN sectionDetails ON courseDetails.p_id = sectionDetails.p_id INNER JOIN facultyDetails ON sectionDetails.f_id = facultyDetails.f_id INNER JOIN syllabiPathDetails ON courseDetails.p_id = syllabiPathDetails.p_id AND sectionDetails.sec_id = syllabiPathDetails.sec_id where crn='" + str + "' and syllabiPathDetails.semester='"+sem+"' and syllabiPathDetails.year='"+year+"'", conn); conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(comm);
        DataSet ds = new DataSet();

        da.Fill(ds);
        if (conn.State.ToString() == "Open")
        {

            conn.Close();

        }
        return ds;
    }


    public DataSet ForResume(String str)
    {
        DataSet ds = new DataSet();
        if (str != null)
        {
            connStr = ConfigurationManager.ConnectionStrings["cba_webappConnectionString1"].ToString();
            conn = new SqlConnection(connStr);
            comm = new SqlCommand(str, conn); conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(comm);

            da.Fill(ds);
            if (conn.State.ToString() == "Open")
            {
                conn.Close();
            }
        }
        return ds;

    }


    public DataSet byFacultyData(String str, String sem, String year)
    {
        DataSet ds = new DataSet();
        if (str != null)
        {
            connStr = ConfigurationManager.ConnectionStrings["cba_webappConnectionString1"].ToString();
            conn = new SqlConnection(connStr);
            comm = new SqlCommand("SELECT departmentDetails.dept_name, sectionDetails.crn, facultyDetails.f_firstName, facultyDetails.f_lastName, syllabiPathDetails.s_path, courseDetails.course_id, courseDetails.course_name FROM courseDetails INNER JOIN departmentDetails ON courseDetails.dept_id = departmentDetails.dept_id INNER JOIN sectionDetails ON courseDetails.p_id = sectionDetails.p_id INNER JOIN facultyDetails ON sectionDetails.f_id = facultyDetails.f_id INNER JOIN syllabiPathDetails ON courseDetails.p_id = syllabiPathDetails.p_id AND sectionDetails.sec_id = syllabiPathDetails.sec_id where facultyDetails.f_id='" + str + "' and syllabiPathDetails.semester='" + sem + "' and syllabiPathDetails.year='" + year + "'", conn); conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(comm);

            da.Fill(ds);
            if (conn.State.ToString() == "Open")
            {
                conn.Close();
            }
        }
        return ds;
        
    }

    public DataSet byCourseName(String str, String sem, String year)
    {
        connStr = ConfigurationManager.ConnectionStrings["cba_webappConnectionString1"].ToString();
        conn = new SqlConnection(connStr);
        comm = new SqlCommand("SELECT departmentDetails.dept_name, sectionDetails.crn, facultyDetails.f_firstName, facultyDetails.f_lastName, syllabiPathDetails.s_path, courseDetails.course_id, courseDetails.course_name FROM courseDetails INNER JOIN departmentDetails ON courseDetails.dept_id = departmentDetails.dept_id INNER JOIN sectionDetails ON courseDetails.p_id = sectionDetails.p_id INNER JOIN facultyDetails ON sectionDetails.f_id = facultyDetails.f_id INNER JOIN syllabiPathDetails ON courseDetails.p_id = syllabiPathDetails.p_id AND sectionDetails.sec_id = syllabiPathDetails.sec_id where courseDetails.course_name LIKE '%" + str + "%' and syllabiPathDetails.semester='" + sem + "' and syllabiPathDetails.year='" + year + "'", conn); conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(comm);
        DataSet ds = new DataSet();

        da.Fill(ds);
        if (conn.State.ToString() == "Open")
        {

            conn.Close();

        }
        return ds;

    }
    public DataSet byDeptData(String str, String sem, String year)
    {
        connStr = ConfigurationManager.ConnectionStrings["cba_webappConnectionString1"].ToString();
        conn = new SqlConnection(connStr);
        comm = new SqlCommand("SELECT departmentDetails.dept_name, sectionDetails.crn, facultyDetails.f_firstName, facultyDetails.f_lastName, syllabiPathDetails.s_path, courseDetails.course_id, courseDetails.course_name FROM courseDetails INNER JOIN departmentDetails ON courseDetails.dept_id = departmentDetails.dept_id INNER JOIN sectionDetails ON courseDetails.p_id = sectionDetails.p_id INNER JOIN facultyDetails ON sectionDetails.f_id = facultyDetails.f_id INNER JOIN syllabiPathDetails ON courseDetails.p_id = syllabiPathDetails.p_id AND sectionDetails.sec_id = syllabiPathDetails.sec_id where departmentDetails.dept_id='" + str + "' and syllabiPathDetails.semester='" + sem + "' and syllabiPathDetails.year='" + year + "'", conn); conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(comm);
        DataSet ds = new DataSet();

        da.Fill(ds);
        if (conn.State.ToString() == "Open")
        {
            conn.Close();
        }
        return ds;
    }

    public DataSet byCourseID(String str, String sem, String year)
    {
        connStr = ConfigurationManager.ConnectionStrings["cba_webappConnectionString1"].ToString();
        conn = new SqlConnection(connStr);
        comm = new SqlCommand("SELECT departmentDetails.dept_name, sectionDetails.crn, facultyDetails.f_firstName, facultyDetails.f_lastName, syllabiPathDetails.s_path, courseDetails.course_id, courseDetails.course_name FROM courseDetails INNER JOIN departmentDetails ON courseDetails.dept_id = departmentDetails.dept_id INNER JOIN sectionDetails ON courseDetails.p_id = sectionDetails.p_id INNER JOIN facultyDetails ON sectionDetails.f_id = facultyDetails.f_id INNER JOIN syllabiPathDetails ON courseDetails.p_id = syllabiPathDetails.p_id AND sectionDetails.sec_id = syllabiPathDetails.sec_id where courseDetails.p_id='" + str + "' and syllabiPathDetails.semester='" + sem + "' and syllabiPathDetails.year='" + year + "'", conn); conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(comm);
        DataSet ds = new DataSet();

        da.Fill(ds);
        if (conn.State.ToString() == "Open")
        {
            conn.Close();
        }
        return ds;
    }

    
    public DataSet gridData(String str)
    {
        connStr = ConfigurationManager.ConnectionStrings["cba_webappConnectionString1"].ToString();
        conn = new SqlConnection(connStr);
        comm = new SqlCommand("SELECT courseDetails.course_id, courseDetails.course_name, departmentDetails.dept_name FROM courseDetails INNER JOIN departmentDetails ON courseDetails.dept_id = departmentDetails.dept_id where course_id='" + str + "'", conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(comm);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (conn.State.ToString() == "Open")
        {
            conn.Close();
        }
        return ds;
    }

    public void addSyllabiEntry(String q){
            connStr = ConfigurationManager.ConnectionStrings["cba_webappConnectionString1"].ToString();
            conn = new SqlConnection(connStr);
            comm = new SqlCommand(q, conn);
            conn.Open();
            comm.ExecuteNonQuery();
            if (conn.State.ToString() == "Open")
            {
                conn.Close();
            }
        }

    public DataSet Search(String crn, String dept, String course, String faculty, String semester, String year)
    {
        String query_addon = "";
        if(!crn.Equals(""))
        {
            query_addon += "crn='" + crn + "' AND "; 
        }

        /*if (!course_keyword.Equals(""))
        {
            query_addon += "courseDetails.course_name LIKE '%" + course_keyword + "%' AND ";
        }*/

        if (!course.Equals("-1"))
        {
            query_addon += "courseDetails.p_id='" + course + "' AND ";
        }

        if (!dept.Equals("-1"))
        {
            query_addon += "departmentDetails.dept_id='" + dept + "' AND ";
        }

        if (!faculty.Equals("-1"))
        {
            String[] facultyArr = new String[] { "", "" };
            if (faculty.Contains(" "))                                  //To check for exactly one whitespace in between faculty name
            {
                facultyArr = faculty.Split(' ');
                query_addon += "(facultyDetails.f_firstName LIKE '%" + facultyArr[0] + "%' AND facultyDetails.f_lastName LIKE '%" + facultyArr[1] + "%') AND ";
            }
            else
                query_addon += "(facultyDetails.f_firstName LIKE '%" + faculty + "%' OR facultyDetails.f_lastName LIKE '%" + faculty + "%') AND ";
        }

        if (!semester.Equals("-1") && !semester.Equals(""))
        {
            query_addon += "syllabiPathDetails.semester='" + semester + "' AND ";
        }

        if (!year.Equals("-1") && !year.Equals(""))                     //Changed acc to new requirement
        {
            query_addon += "syllabiPathDetails.year='" + year + "' AND ";
        }

        
        connStr = ConfigurationManager.ConnectionStrings["cba_webappConnectionString1"].ToString();
        conn = new SqlConnection(connStr);
        comm = new SqlCommand("SELECT departmentDetails.dept_name, sectionDetails.crn, syllabiPathDetails.semester, syllabiPathDetails.year, facultyDetails.f_firstName, facultyDetails.f_lastName, syllabiPathDetails.s_path, courseDetails.course_id, courseDetails.course_name FROM courseDetails INNER JOIN departmentDetails ON courseDetails.dept_id = departmentDetails.dept_id INNER JOIN sectionDetails ON courseDetails.p_id = sectionDetails.p_id INNER JOIN facultyDetails ON sectionDetails.f_id = facultyDetails.f_id INNER JOIN syllabiPathDetails ON courseDetails.p_id = syllabiPathDetails.p_id AND sectionDetails.sec_id = syllabiPathDetails.sec_id where " + query_addon + " 1=1", conn); conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(comm);
        DataSet ds = new DataSet();

        da.Fill(ds);
        if (conn.State.ToString() == "Open")
        {
            conn.Close();
        }
        return ds;

    }
}
