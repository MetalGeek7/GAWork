<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_dept.aspx.cs" Inherits="add_dept" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>College of Business Administration - Add Department</title>
    <link rel="Stylesheet" href="style.css" type="text/css" />
</head>
<body>
    <div id="mainContainer">
        <div class="header">
             <br />&nbsp;<img alt="CBA Logo" src="logo_cba.gif" align="middle" /><br /><br />
        </div>
        <div id="mainHeading"><h4>Admin Module - Add Department</h4></div>
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
                        <asp:Label id="label2" AssociatedControlId="dept_name" Text="Department Name:" runat="server" />
                    </div>
                    <div>
                        <asp:TextBox id="dept_name" runat="server" /> 
                        <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                           ControlToValidate="dept_name" InitialValue=""
                           ErrorMessage="Department Name: is a required field."
                           ForeColor="Red">
                            </asp:RequiredFieldValidator>
                    </div>
                    <div style="clear:both"></div>
                </div>
                <div class="searchOption">
                    <div>
                        
                    </div>
                    <div>
                        <asp:Button runat="server" ID="addCourse_btn" OnClick="addDept" Text="Add Department" />
                    </div>
                    <div style="clear:both"></div>
                </div>
            </div>
        </form>
    </div>
    <div id="footer">College of Business Administration - University of Illinois at Chicago</div>
</body>
</html>
