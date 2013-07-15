<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload_resume.aspx.cs" Inherits="upload_resume" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="Stylesheet" href="style.css" type="text/css" />
    <title>Upload Resume for Faculty</title>
</head>

<body>
    <div id="mainContainer">
        <div class="header">
             <br />&nbsp;<img alt="CBA Logo" src="logo_cba.gif" align="middle" /><br /><br />
        </div>
        <div id="mainHeading"><h4>Upload CV for Faculty</h4></div>
        <form id="form1" runat="server">
            <div>
                
                <div class="menu">
                    <asp:Literal ID="HtmlMenu" runat="server"></asp:Literal>
                </div>
                <div>
                    <div class="searchOption">
                        <div class="label"></div>
                        
                        <div>
                            
                        </div>
                        <div style="clear:both"></div>
                    </div>
                    <div class="searchOption">
                        <div class="label">Select Department: </div>
                        
                        <div>
                            <asp:dropdownlist AutoPostBack="true" OnSelectedIndexChanged="populateFacultyDropDown" ID="DD_Dept_list" runat="server"></asp:dropdownlist>
                            <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                               ControlToValidate="DD_Dept_list" InitialValue="-1"
                               ErrorMessage="Invalid Selection" ValidationGroup=""
                               ForeColor="Red">
                                </asp:RequiredFieldValidator>
                        </div>
                        <div style="clear:both"></div>
                    </div>
                    <div class="searchOption">
                        <div class="label">Select Faculty:</div>
                        <div>
                            <asp:dropdownlist ID="facultyDropDownList" runat="server"></asp:dropdownlist>
                            <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                               ControlToValidate="facultyDropDownList" InitialValue="-1"
                               ErrorMessage="Invalid Selection" ValidationGroup=""
                               ForeColor="Red">
                                </asp:RequiredFieldValidator>
                        </div>
                        <div style="clear:both"></div>
                    </div>
                    <div class="searchOption">
                       <div class="label">Select Resume(PDF): </div>
                       <div>
                           <asp:FileUpload ID="resumeUploadOption" runat="server" />
                           <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                                   ControlToValidate="resumeUploadOption" InitialValue="" 
                                   ErrorMessage="file is a required field."
                                   ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                       </div>
                       <div style="clear:both"></div>
                       
                    </div>
                    <div class="searchOption">
                        <div></div>
                        <div><asp:Button OnClick="UploadResumeFunc" ID="UploadResumeButton" runat="server" Text="Upload" /></div>
                        <div style="clear:both"></div>
                    </div>
                    
                 </div>
                
             </div>
        </form>
    </div>
    <div id="footer">College of Business Administration - University of Illinois at Chicago</div>
    
</body>
</html>
