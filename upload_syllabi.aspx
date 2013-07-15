<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload_syllabi.aspx.cs" Inherits="upload_syllabi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>College of Business Administration - Upload Syllabi</title>
    <link rel="Stylesheet" href="style.css" type="text/css" />


</head>

<body>
    <div id="mainContainer">
        <div class="header">
             <br />&nbsp;<img alt="CBA Logo" src="logo_cba.gif" align="middle" /><br /><br />
        </div>


        <div id="mainHeading"><h4>Admin Module - Add Syllabus</h4></div>
        <form runat="server">
                <div class="menu">
                    <asp:Literal ID="HtmlMenu" runat="server"></asp:Literal>
                    <div style="clear:both"></div>
                </div>
                <div class="form_container" id="div_upload_syllabi_form" runat="server">
                    
                     <div class="searchOption">
                        <div class="label">
                           
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
                            <asp:dropdownlist AutoPostBack="true" OnSelectedIndexChanged="populateDropDowns" ID="DD_Dept_list" runat="server"></asp:dropdownlist>
                            <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
                               ControlToValidate="DD_Dept_list" InitialValue="-1"
                               ErrorMessage="Invalid Selection"
                               ForeColor="Red">
                                </asp:RequiredFieldValidator>
                        </div>
                        
                        <div style="clear:both"></div>
                    </div>
                    <div class="searchOption">
                        <div class="label">
                            Select Course: 
                        </div>
                        <div>
                            <asp:dropdownlist AutoPostBack="True" 
                            id="course_name" runat="server" 
                             ></asp:dropdownlist>
                             <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                               ControlToValidate="course_name" InitialValue="-1"
                               ErrorMessage="Invalid Selection"
                               ForeColor="Red">
                                </asp:RequiredFieldValidator>
                        </div>
                        
                       <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:cba_webappConnectionString1 %>" 
                            SelectCommand="SELECT p_id,course_id+','+course_name as cName FROM courseDetails">
                        </asp:SqlDataSource>--%>
                        <div style="clear:both"></div>
                    </div>
                    <div class="searchOption">
                        <div class="label">
                            Enter CRN:
                        </div>
                        <div>
                            <asp:TextBox id="section" runat="server" /> 
                            <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                               ControlToValidate="section" InitialValue=""
                               ErrorMessage="Section is a required field."
                               ForeColor="Red">
                                </asp:RequiredFieldValidator>
                        </div>
                        <div style="clear:both"></div>
                    </div>
                    <div class="searchOption">
                        <div class="label">Choose Faculty:</div>
                        <div>
                            <asp:dropdownlist ID="facultyDropDownList" runat="server"></asp:dropdownlist>
                            <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                               ControlToValidate="facultyDropDownList" InitialValue="-1"
                               ErrorMessage="Invalid Selection"
                               ForeColor="Red">
                                </asp:RequiredFieldValidator>
                        </div>
                        <div style="clear:both"></div>
                    </div>
                    <div class="searchOption">
                        <div class="label">
                            Select Semester:
                        </div>
                        <div> 
                            <select name="semester" id="semester" runat="server">
                                <option value="Fall">Fall</option>
                                <option value="Spring">Spring</option>
                                <option value="Summer">Summer</option>
                            </select>
                        </div>
                        <div style="clear:both"></div>
                    </div>
                    <div class="searchOption">
                        <div class="label">Select Year:</div>
                        <div>
                            <select name="year" id="year" runat="server">
                                <option value="2012">2012</option>
                                <option value="2013">2013</option>
                                <option value="2014">2014</option>
                            </select>
                        </div>
                        <div style="clear:both"></div>
                    </div>
                    <div class="searchOption">
                        <div class="label">Upload file: </div>
                        <div>
                            <asp:FileUpload ID="syllabi" runat="server"></asp:FileUpload>
                        
                            <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                               ControlToValidate="syllabi" InitialValue=""
                               ErrorMessage="file is a required field."
                               ForeColor="Red">
                                </asp:RequiredFieldValidator>
                        </div>
                        <div style="clear:both"></div>
                    </div>
                    <div class="searchOption">
                        <div></div>
                        <div>
                            <asp:Button ID="submit_upload_syllabi_form" OnClick="uploadSyllabifunc" runat="server" Text=" Upload "/>
                        </div>
                        <div style="clear:both"></div>
                    </div>
                </div>
            </form>
     </div>
     <div id="footer">College of Business Administration - University of Illinois at Chicago</div>
</body>
</html>
