<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Muqadam.AdminPanel.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Muqadam | AdminPanal | Login</title>

    <%--local bootstrap--%>
    <link rel="Stylesheet" href="../bootstrap/bootstrap.min.css" type="text/css" />
        
    <%--login css--%>
    <link rel="stylesheet" href="../css/login.css" />

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style type="text/css">
    </style>

    <script type="text/javascript">
        
    </script>

</head>

<body>

<div class="container">
        <div class="card card-container">
            <img id="profile-img" class="profile-img-card" src="res_images/avatar_2x.png" alt="User Image" />

            <div class="alert alert-dark" role="alert" style="text-align: center;">
                <strong>Muqadam</strong> Admin Panel
            </div>

            <%--<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Muqadam</strong> Admin Panel.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>--%>

            <p id="profile-name" class="profile-name-card"></p>

    <form id="form1" runat="server" class="form-signin">
    
                <span id="reauth-email" class="reauth-email"></span>

                <asp:TextBox ID="txtUserName" runat="server" class="form-control" placeholder="User Name" required autofocus ></asp:TextBox>
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" class="form-control" placeholder="Password" required ></asp:TextBox>

                <!-- <div id="remember" class="checkbox"> -->
                    <!-- <label> -->
                        <!-- <input type="checkbox" value="remember-me"> Remember me -->
                    <!-- </label> -->
                <!-- </div> -->

                <asp:Button ID="btnSubmit" runat="server" Text="Sign in" OnClick="btnSubmit_Click" CssClass="btn btn-lg btn-primary btn-block btn-signin" /> <%--ValidationGroup="validbtnSubmit_Click"--%>
                <%--<div class="alert alert-danger" role="alert">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="false" ShowMessageBox="true" ValidationGroup="validbtnSubmit_Click" />
                </div>--%>
                    
            
    </form>

    <!-- <a href="#" class="forgot-password"> -->
                <!-- Forgot the password? -->
            <!-- </a> -->
			
        </div><!-- /card-container -->
    </div><!-- /container -->


    













    <!-- Footer -->
<footer class="footer">
    <div class="footer-copyright text-center py-3">© 2018 Copyright:
      <a href="https://Google.com/"> Google.com</a>
      <span class="author">: by Sikandar</span>
    </div>
  </footer>
  <!-- Footer -->












    <script type="text/javascript" src="../bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="../bootstrap/jquery-3.3.1.slim.min.js"></script>
    <script type="text/javascript" src="../bootstrap/popper.min.js"></script>
</body>
</html>
