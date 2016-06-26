<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="YSGOpsWeb.Pages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>YSG Management System</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet">
		<link href="../Content/styles.css" rel="stylesheet">

</head>
<body>
    <form id="form1" runat="server">

     <div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true" style="background-color: #f7caac">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <img src="../images/logo.jpg" class="img-rounded center-block" alt="Responsive image">
      </div>
      <div class="modal-body">
            <div class="form-group">
                <asp:TextBox ID="txtusername" runat="server" class="form-control input-lg" placeholder="User Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
              <asp:TextBox ID="txtpassword" runat="server" class="form-control input-lg" placeholder="Password" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
            &nbsp;</div>
            <div class="form-group">
                <asp:Button ID="LoginButton" class="btn btn-primary btn-lg btn-block" runat="server" Text="Login" ValidationGroup="Login1" OnClick="LoginButton_Click" />
              <span class="pull-right"><a href="#">Register</a></span><span><a href="#">Need help?</a></span>
            </div>
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
		  </div>	
      </div>
  </div>
  </div>
</div>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="../Scripts/bootstrap.min.js"></script>

    <div>
        
</div>
    </form>
</body>
</html>
