<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search_resume.aspx.cs" Inherits="search_resume" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Stylesheet" href="style.css" type="text/css" />
    <title>Search Faculty Resume</title>
</head>
<body>
    <div id="wrapper">
        <div class="header">
             <br />&nbsp;<img alt="CBA Logo" src="logo_cba.gif" align="middle" /><br /><br />
        </div>
        <div id="mainContainer">
            <div id="mainHeading"><h4>Search CV's for Faculty</h4></div>
            <form id="form1" runat="server">
                <div>
                    <div class="heading"><h4>Search Options:</h4></div>
                    <div class="searchOption">
                         <div>
                         </div>
                         <div>
                         </div>
                         <div style="clear:both"></div>
                    </div>
                    <div class="searchOption">
                         <div class="label">
                                    Select Department:
                         </div>
                         <div>
                                     <asp:dropdownlist AutoPostBack="True" 
                                        id="DD_Dept_list" runat="server"></asp:dropdownlist>
                         </div>
                         <div>
                                     <asp:Button OnClick="searchByDeptFunc" ID="searchByDeptButton" runat="server" Text="Search" ValidationGroup="dept_validation" />
                                     <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                                   ControlToValidate="DD_Dept_list" InitialValue="-1"
                                   ErrorMessage="Invalid Department Selection" ValidationGroup="dept_validation"
                                   ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                         </div>
                         <div style="clear:both"></div>
                    </div>
                    <div class="searchOption">
                        <div class="label">
                                    Select Faculty: 
                        </div>
                        <div>
                            <asp:DropDownList ID="facultyDropDownList" runat="server"></asp:DropDownList>
                            
                        </div>
                        <div>
                            <asp:Button OnClick="searchByFacultyFunc" ID="searchByFacultyButton" runat="server" Text="Search" ValidationGroup="faculty_validation" />
                            <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                               ControlToValidate="facultyDropDownList" InitialValue="-1"
                               ErrorMessage="Invalid Selection" ValidationGroup="faculty_validation"
                               ForeColor="Red">
                                </asp:RequiredFieldValidator>
                        </div>
                        <div style="clear:both"></div>
                    </div>
                    <div style="clear:both"></div>
                </div>              
                <div>
                    <div class="heading"><h4>Search Results:</h4></div>
                    <div class="searchResults">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" ForeColor="#333333" GridLines="None" EmptyDataText="No Results!!">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="f_firstName" HeaderText="First Name" >
                                <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                <ItemStyle HorizontalAlign="Left" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="f_lastName" HeaderText="Last Name" >
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="dept_name" HeaderText="Department" 
                                    ApplyFormatInEditMode="True" >
                                <HeaderStyle HorizontalAlign="Left" Width="200px" />
                                <ItemStyle HorizontalAlign="Left" Width="300px" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="resume_path" HeaderText="Resume" 
                                    Target="_blank" Text="Click Here" >
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" Width="150px" />
                                </asp:HyperLinkField>
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                    </div>
                </div>
                
            </form>
        </div>
        <div id="footer">College of Business Administration - University of Illinois at Chicago</div>
     </div>
</body>
</html>
