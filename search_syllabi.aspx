<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search_syllabi.aspx.cs" Inherits="search_syllabi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>College of Business Administration - Search Syllabi</title>
    <link type="text/css" rel="stylesheet" href="style.css" ></link>
    
</head>
<body>
    <div id="mainContainer">
        <div class="header">
             <br />&nbsp;<img alt="CBA Logo" src="logo_cba.gif" align="middle" /><br /><br />
        </div>
        <div>
            <div id="mainHeading"><h4>Search Syllabi</h4></div>
            <form id="form1" runat="server">
                
                <div>
                    <div class="heading"><h4>Search Options - Specify at least one</h4></div>
                    <div class="searchOption" id="Div1" runat="server"> 
                        <div>
                           
                        </div>
                        <div>
                            
                        </div>
                        <div style="clear:both" ></div>
                    </div>

                      <div class="searchOption" id="Div4" runat="server"> 
                        <div class="label">
                           <asp:Label id="label2" AssociatedControlId="tb1" Text="Select Term:" runat="server" />
                        </div>
                        <div>
                            <asp:DropDownList CssClass="sem-year" ID="semester" Width="250px" runat="server">
                            </asp:DropDownList>
                            <%-- 
                            <asp:DropDownList CssClass="sem-year" ID="year" runat="server">
                            </asp:DropDownList>
                            --%>
                        </div>
                        <div style="clear:both" ></div>
                    </div>
                     <div class="searchOption" id="form_dept_list">
                        <div class="label">Select Subject:</div>
                        <div>
                            <asp:DropDownList ID="DD_Dept_list" runat="server">
                            </asp:DropDownList>
                        </div>
                        <%--<div>
                            <asp:Button ID="SearchbyDeptName" runat="server" Text="Search by Department" 
                                onclick="SearchbyDeptName_Click" Width="181px" ValidationGroup="dept_validation" />
                            <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                                   ControlToValidate="DD_Dept_list" InitialValue="-1"
                                   ErrorMessage="Invalid Selection" ValidationGroup="dept_validation"
                                   ForeColor="Red">
                             </asp:RequiredFieldValidator>  
                        </div> --%> 
                        <div style="clear:both"   ></div>
                    </div>
                      <div class="searchOption" id="Div2">
                        <div class="label">Select Course:</div>
                        <div>
                            <asp:DropDownList ID="course_List" runat="server">
                            </asp:DropDownList>
                        </div>
                        <%--<div>
                            <asp:Button ID="SearchbyCourseID" runat="server" Text="Search by Course" 
                                onclick="SearchbyCourseID_Click" Width="181px" ValidationGroup="cname_validation" />
                            <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
                                   ControlToValidate="course_List" InitialValue="-1"
                                   ErrorMessage="Invalid Selection" ValidationGroup="cname_validation"
                                   ForeColor="Red">
                             </asp:RequiredFieldValidator>  
                        </div>--%>  
                        <div style="clear:both"   ></div>
                    </div>
                    
                    
                    <%--<div class="searchOption" id="Div3" runat="server"> 
                        <div>
                           
                        </div>
                        <div>
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OR</strong>
                        </div>
                        <div style="clear:both" ></div>
                    </div>--%>

                      <div class="searchOption" id="Div3">
                        <div class="label">Select Faculty: </div>
                        <div>
                            <asp:TextBox ID="DD_Faculty_list" Width="245px" runat="server" CausesValidation="True"></asp:TextBox>
                        </div>
                        <%--<div>
                            <asp:Button ID="SearchbyFaculty" runat="server" Text="Search by Faculty Name" 
                                onclick="SearchbyFaculty_Click" Width="181px" ValidationGroup="faculty_validation"/>
                            <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                                   ControlToValidate="DD_Faculty_list" InitialValue="-1"
                                   ErrorMessage="Invalid Selection" ValidationGroup="faculty_validation"
                                   ForeColor="Red">
                             </asp:RequiredFieldValidator>  
                        </div> --%>
                        <div style="clear:both"></div>
                    </div>

                    <div class="searchOption" id="form_crn" runat="server"> 
                        <div class="label">
                            <asp:Label id="label" AssociatedControlId="tb1" Text="Enter CRN here:" runat="server" />
                        </div>
                        <div>
                            <asp:TextBox id="tb1" runat="server" Width="245px" /> 
                       
                        </div>
                       <%-- <div>
                            <asp:Button ID="searchByCRN_a" runat="server" onclick="searchByCRN" Text="Search by CRN" 
                            Width="181px" ValidationGroup="crn_validation" />
                            <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                                   ControlToValidate="tb1" InitialValue=""
                                   ErrorMessage="Enter CRN" ValidationGroup="crn_validation"
                                   ForeColor="Red">
                             </asp:RequiredFieldValidator>
                        </div> --%>
                        <div style="clear:both" ></div>
                    </div>

                    
                     <%--<div class="searchOption" id="Div6" runat="server"> 
                        <div>
                           
                        </div>
                        <div>
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OR</strong>
                        </div>
                        <div style="clear:both" ></div>
                    </div>--%>
                   
                    <%--<div class="searchOption" id="Div7" runat="server"> 
                        <div>
                           
                        </div>
                        <div>
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OR</strong>
                        </div>
                        <div style="clear:both" ></div>
                    </div>--%>
                  
                   <%-- <div class="searchOption" id="Div8" runat="server"> 
                        <div>
                           
                        </div>
                        <div>
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OR</strong>
                        </div>
                        <div style="clear:both" ></div>
                    </div>--%> 
                   <%--<div class="searchOption" id="form_course_bane" runat="server"> 
                        <div class="label">
                            <asp:Label id="label1" AssociatedControlId="courseName" Text="Enter Coursename Keywords:" runat="server" />
                        </div>
                        <div>
                            <asp:TextBox id="courseName" runat="server" Width="245px" /> 
                        </div> 
                        <div>
                            <asp:Button ID="searchByCourseName_a" runat="server" onclick="searchByCourseName" Text="Search by Keywords" 
                                Width="181px" ValidationGroup="courseName_validation"/>
                            <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                                   ControlToValidate="courseName" InitialValue=""
                                   ErrorMessage="Enter Text" ValidationGroup="courseName_validation"
                                   ForeColor="Red">
                            </asp:RequiredFieldValidator> 
                        </div> 
                        <div style="clear:both"   ></div>
                    </div>
                    --%>
                    <%--<div class="searchOption" id="Div9" runat="server"> 
                        <div>
                           
                        </div>
                        <div>
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OR</strong>
                        </div>
                        <div style="clear:both" ></div>
                    </div>--%>
                  
                    
                    <div class="searchOption" id="Div10" runat="server"> 
                        <div class="label">
                           
                        </div>
                        <div>
                            <asp:Button ID="search_common" runat="server" onclick="commonSearch" Text=" Search " 
                                Width="181px"/>
                           
                        </div>
                        <div style="clear:both" ></div>
                    </div>  
                    <div style="clear:both"   ></div>
                </div>
                <div>
                    <div class="heading"><h4>Search Results:</h4></div>
                    <div class="searchResults">
                        
                        <asp:GridView ID="GridView1" EmptyDataText="Sorry no Data Available for your search Criteria" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" ForeColor="#333333" GridLines="None">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="crn" HeaderText="CRN" />
                                    <asp:BoundField DataField="course_name" HeaderText="Course Name" >
                                    <ControlStyle BorderStyle="Dotted" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                                    <asp:BoundField DataField="semester" HeaderText="Semester" />
                                    <asp:BoundField DataField="year" HeaderText="Year" />
                                    <asp:BoundField DataField="f_firstName" HeaderText="Faculty FirstName" />
                                    <asp:BoundField DataField="f_lastName" HeaderText="Faculty LastName" />
                                    <asp:BoundField DataField="dept_name" HeaderText="Department" />
                                    <asp:HyperLinkField HeaderText="Syllabus" Text="Click here" 
                                        DataNavigateUrlFields="s_path" Target="_blank" />
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
    </div>
    <div id="footer">College of Business Administration - University of Illinois at Chicago</div>
</body>
</html>
