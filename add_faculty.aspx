<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_faculty.aspx.cs" Inherits="add_faculty" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Faculty</title>
    <link rel="Stylesheet" href="style.css" type="text/css" />
</head>
<body>
    <div id="mainContainer">
        <div class="header">
             <br />&nbsp;<img alt="CBA Logo" src="logo_cba.gif" align="middle" /><br /><br />
        </div>
        <div id="mainHeading"><h4>Add Faculty</h4></div>
        <form id="form1" runat="server">
            <div>
                <div class="menu">
                    <asp:Literal ID="HtmlMenu" runat="server"></asp:Literal><br />
                </div>
            
                <div>
                    
                    <div>
                         <div class="searchOption">
                            <div class="label"></div>
                            
                            <div>
                                
                            </div>
                            <div style="clear:both"></div>
                         </div>
                         <div class="searchOption">
                            <div class="label">
                                <asp:Label id="label2" AssociatedControlId="f_firstName" Text="Faculty First name:" runat="server" />
                            </div>
                            <div>
                                <asp:TextBox id="f_firstName" runat="server" /> 
                                <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                                   ControlToValidate="f_firstName" InitialValue=""
                                   ErrorMessage="Faculty First name: is a required field."
                                   ForeColor="Red"></asp:RequiredFieldValidator>
                             </div>
                            <div style="clear:both"></div>
                         </div>
                         <div class="searchOption">
                             <div class="label">   
                                <asp:Label id="label1" AssociatedControlId="f_lastName" Text="Faculty Last name:" runat="server" />
                             </div>
                             <div>
                                <asp:TextBox id="f_lastName" runat="server" /> 
                                <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                                       ControlToValidate="f_lastName" InitialValue=""
                                       ErrorMessage="Faculty Last name: is a required field."
                                       ForeColor="Red"></asp:RequiredFieldValidator>
                             </div>
                            <div style="clear:both"></div>
                         </div>
                         <div class="searchOption">
                                <div class="label">Select Department: </div>
                                <div>
                                    <asp:DropDownList ID="DD_Dept_list" runat="server"> 
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                                       ControlToValidate="DD_Dept_list" InitialValue="-1"
                                       ErrorMessage="Invalid Selection"
                                       ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div style="clear:both"></div>
                         </div>
                         <div class="searchOption">
                                <div></div>
                                <div>
                                    <asp:Button runat="server" ID="addFaculty_btn" OnClick="addFaculty" Text="Add Faculty" />
                                </div>
                                <div style="clear:both"></div>
                          </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div id="footer">College of Business Administration - University of Illinois at Chicago</div>
    
</body>
</html>
