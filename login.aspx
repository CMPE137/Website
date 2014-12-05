<%@ Page Title="Pain Diary - Login" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="_Default" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Pain Diary - Login</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
  </head>
  <body>
    <div class="container-fluid">
      <div class = "row">
        <div class = "col-md-6 col-md-offset-3 col-xs-12">
         <h1>Login</h1>
         <form runat = "server">
            <table class="table table-bordered">
              <tr>
                <th width = "20%">E-Mail</th>
                <td><input type="text" class="form-control" id="inputEmail" placeholder="Enter E-Mail" runat = "server"></td>
              </tr>
              <tr>
                <th width = "20%">Password</th>
                <td><input type="password" class="form-control" id="inputPassword" placeholder="Enter Password" runat = "server"></td>
              </tr>
            </table>
            <asp:button type="submit" class="btn btn-success" runat = "server" id = "loginButton" onClick = "loginClick" text = "Login" />
            <a href = "register.aspx"><button type="button" class="btn btn-danger">Register</button></a>
          </form> 
        </div>
      </div>
    <asp:panel>
     <div class = "row" id = "errorMsg" runat = "server" visible = false>
      <center>E-Mail and password do not match!</center>
      </div>
     </asp:panel>
    </div>
  </body>
</html>