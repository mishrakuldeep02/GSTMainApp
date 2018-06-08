<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmRequestForDemo.aspx.cs" Inherits="frmRequestForDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Request for Demo</title>
    <link href="Content/css/admin_style.css" rel="stylesheet" />
    <link href="Content/css/Loader.css" rel="stylesheet" />
    <script src="Content/js/jquery.min.js"></script>
    <script type="text/javascript">

        $("form").on("submit", function (e) {
            if (!Page_IsValid) {
                return;
            } else
            {
                $('.loading').addClass('active');
            }
            if (waiting) return false;
            waiting = true;
            
        });
       
    </script>
</head>
<body class="request_for_demo_page">
    <form id="form1" runat="server">
         <div class="loading"></div>
        <div class="wrapper">
            <nav role="navigation" class="navbar navbar-default navbar-top navbar-fixed-top">
                <div class="navbar-header">
                    <a href="javascript:void(0);" class="navbar-brand">
                        <div class="brand-logo">
                            <img src="Content/img/logo.png" alt="App Logo" class="img-responsive" />
                        </div>
                        <div class="brand-logo-collapsed">
                            <img src="Content/img/logo-single.png" alt="App Logo" class="img-responsive" />
                        </div>
                    </a>
                </div>
                <div class="nav-wrapper">
                     <div class="col-sm-8 oswalhead text-center">
                        <%--<asp:Label ID="lblOrgName" runat="server" />--%>
                        <label class="lbtext">GST Return Filing Portal</label>
                    </div>
                </div>
            </nav>
            <section>
                <div class="content-wrapper">
                    <div class="form_request_box">
                        <div class="form-horizontal">
                            <div class="row">
                            <div class="col-lg-12"><h4 class="text-center">Registration Form</h4></div>
                            <div class="col-lg-12 pull-right">
                                 
                                <a class="pull-right" href="frmlogin.aspx" >Already Registered, Login Here </a>
                            
                            </div></div>
                           
                            <hr class="row" />
                            <div class="form-group">
                                <label class="col-sm-4 control-label">CA / Tax Consultant Name :</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" MaxLength="100" style="text-transform:uppercase" CssClass="form-control" placeholder="Full Name" ID="Txt_CaName" ValidateRequestMode="Inherit"/>
                                      <asp:RequiredFieldValidator  CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator12" ControlToValidate="Txt_CaName" ErrorMessage="Enter CA Name." ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>                                  
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="Txt_CaName" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" " />
                                    
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">Organisation Name :</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" MaxLength="40" CssClass="form-control" placeholder="Organisation Name" ID="Txt_OrganizationName"/> 
                                      <asp:RequiredFieldValidator  CssClass="text-danger"  ValidationGroup="validate" runat="server" ID="RequiredFieldValidator1" ControlToValidate="Txt_OrganizationName" ErrorMessage="Please Enter Organization Name." ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>                                                                          
                                </div>
                            </div>

                           <asp:ScriptManager runat="server"></asp:ScriptManager>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Mobile No. :</label>
                                <div class="col-sm-8" style="margin-bottom: -1.5em;margin-top: 0em;">
        <asp:TextBox runat="server" MaxLength="10" CssClass="form-control" placeholder="Mobile No." ID="Txt_MobNo"/>                                              
       <asp:RequiredFieldValidator  CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator3" ControlToValidate="Txt_MobNo" ValidationExpression="[0-9]{10}"
           ErrorMessage="Please Enter Mobile No." ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>                                                                 
  <asp:RegularExpressionValidator  CssClass="text-danger"  ValidationGroup="validate" ID="RegularExpressionValidator7" 
      runat="server"  ErrorMessage="Please Enter 10 Digit Mobile No."  SetFocusOnError="true" ControlToValidate="Txt_MobNo" ForeColor="Red" ValidationExpression="[0-9]{10}">
  </asp:RegularExpressionValidator>
  <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" TargetControlID="Txt_MobNo" FilterMode="ValidChars" FilterType="Numbers" />
                                </div>       
                             </div>

                                <div class="form-group">
                               <label class="col-sm-4 control-label">Email Id. :</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" MaxLength="50" CssClass="form-control" placeholder="Email Id." ID="Txt_EmailId"> </asp:TextBox>
                                             <asp:RequiredFieldValidator  CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator16" ControlToValidate="Txt_EmailId" ForeColor="Red" ErrorMessage="Enter Email ID." SetFocusOnError="true"></asp:RequiredFieldValidator>                                                                            
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Enter Valid Email ID" SetFocusOnError="true" ValidationGroup="validate" ControlToValidate="Txt_EmailId" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>                                       
                                    </div>                                    
                                </div>  
                          <%--                         
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Landline No. :</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" CssClass="form-control" placeholder="Landline No." ID="Txt_LandLineNo"/>  
                                   <asp:RequiredFieldValidator  CssClass="text-danger"  ValidationGroup="validate" runat="server" ID="RequiredFieldValidator2" ControlToValidate="Txt_LandLineNo" ErrorMessage="Please Enter LandLine No." ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>                                                                                                
                                       <asp:RegularExpressionValidator ValidationGroup="validate" ID="RegularExpressionValidator1" runat="server" ControlToValidate="Txt_LandLineNo" ValidationExpression="^\d[0-9]{10}$" ForeColor="Red" ErrorMessage="Please Enter 11 Digits LandLine No."></asp:RegularExpressionValidator>                                       
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="Txt_LandLineNo" FilterMode="ValidChars" FilterType="Numbers" />

                                </div>
                            </div>--%>
                            <div>
                                <asp:Label runat="server" ForeColor="Red" Visible="false" ID="Label_ErrorMsg"></asp:Label>
                            </div>
                             <div class="form-group">
                                <div class="col-sm-12 text-center btn_container_request_for_demo">
                                    <asp:LinkButton  Text="Request" CssClass="btn btn-primary" ValidationGroup="validate" runat="server" OnClick="Submit_Click"/>
                                    <asp:LinkButton Text="Cancel" CssClass="btn btn-danger" runat="server" OnClick="Cancel_Click"/>
                                </div>
                            </div>

                            
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>
</body>
    
</html>
