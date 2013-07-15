<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_course.aspx.cs" Inherits="add_course" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>College of Business Administration - Add Course</title>
    <link rel="Stylesheet" href="style.css" type="text/css" />
</head>
<body>
    <div id="mainContainer">
        <div class="header">
             <br />&nbsp;<img alt="CBA Logo" src="logo_cba.gif" align="middle" /><br /><br />
        </div>
        <div id="mainHeading"><h4>Admin Module - Add Course</h4></div>
        <form id="form1" runat="server">
            <div class="menu">
                <asp:Literal ID="HtmlMenu" runat="server"></asp:Literal>
                <div style="clear:both"></div>
            </div>
            <div>
                 <div class="searchOption">
                    <div class="label">
                        
                    </div>
                    <div>
                        
                     </div>
                     <div style="clear:both"></div>
                </div>
                <div class="searchOption">
                    <div class="label">
                        <asp:Label id="label2" AssociatedControlId="course_id" Text="Course ID:" runat="server" />
                    </div>
                    <div>
                        <asp:TextBox id="course_id" runat="server" /> 
                        <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                           ControlToValidate="course_id" InitialValue=""
                           ErrorMessage="Course ID: is a required field."
                           ForeColor="Red">
                            </asp:RequiredFieldValidator>
                     </div>
                     <div style="clear:both"></div>
                </div>
                <div class="searchOption">
                    <div class="label">
                        <asp:Label id="label1" AssociatedControlId="course_name" Text="Course Name:" runat="server" />
                    </div>
                    <div>
                            <asp:TextBox id="course_name" runat="server" /> 
                            <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                               ControlToValidate="course_name" InitialValue=""
                               ErrorMessage="Course Name: is a required field."
                               ForeColor="Red">
                                </asp:RequiredFieldValidator>
                    </div>
                    <div style="clear:both"></div>
               </div>
               <div class="searchOption">
                    <div class="label">
                        Select Department: 
                    </div>
                    <div>
                        <asp:DropDownList ID="DD_Dept_list" runat="server"> 
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                               ControlToValidate="DD_Dept_list" InitialValue="-1"
                               ErrorMessage="Invalid Selection"
                               ForeColor="Red">
                                </asp:RequiredFieldValidator>
                    </div>
                    <div style="clear:both"></div>
                </div>
                <div class="searchOption">
                    <div>
                        
                    </div>
                    <div>
                        <asp:Button runat="server" ID="addCourse_btn" OnClick="addCourse" Text="Add Course" />
                    </div>
                    <div style="clear:both"></div>
                </div>
                    
            </div>
        </form>
    </div>
    <div id="footer">College of Business Administration - University of Illinois at Chicago</div>
</body>
</html>
