<%@ Page Title="Pain Diary - Register" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="_Default" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Pain Diary - Register</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <script type='text/JavaScript' src='scw.js'></script>
  </head>

  <body>
    <div class="container-fluid">
      <div class = "row">
        <div class = "col-md-6 col-md-offset-3 col-xs-12">
         <h1>Register</h1>
         <form runat = "server">
            <table class="table table-bordered">
              <tr>
                <th width = "20%">Firstname</th>
                <td><input type="text" class="form-control" id="inputFirstname" placeholder="Enter Firstname" runat = "server"></td>
              </tr>
              <tr>
                <th width = "20%">Lastname</th>
                <td><input type="text" class="form-control" id="inputLastname" placeholder="Enter Lastname" runat = "server"></td>
              </tr>
              <tr>
                <th width = "20%">E-Mail</th>
                <td><input type="text" class="form-control" id="inputEmail" placeholder="Enter E-Mail" runat = "server"></td>
              </tr>
              <tr>
                <th width = "20%">Password</th>
                <td><input type="password" class="form-control" id="inputPassword" placeholder="Enter Password" runat = "server"></td>
              </tr>
              <tr>
                <th width = "20%">Date of Birth</th>
                <td><input type="text" class="form-control" id="inputDate" runat = "server" onclick="scwShow(this, event);">
                  
                </td>
              </tr>
              <tr>
                <th width = "20%">Gender</th>
                <td>
                    <select class = "form-control" id ="inputGender" runat = "server">
                      <option value = "male">Male</option>
                      <option value = "female">Female</option>
                    </select>
                </td>
              </tr>
            </table>
            <asp:button type="submit" class="btn btn-primary" runat = "server" id = "registerButton" onClick = "registerClick" text = "Register" /> 
          </form> 
        </div>
      </div>
     <asp:panel>
      <div class = "row" id = "errorMsgMailInUse" runat = "server" visible = false>
        <center>Email already in use!</center>
      </div>
     </asp:panel>
     <asp:panel>
      <div class = "row" id = "errorMsgIncompleteForm" runat = "server" visible = false>
        <center>Please fill out the entire form!</center>
      </div>
     </asp:panel>
     <asp:panel>
      <div class = "row" id = "successMsg" runat = "server" visible = false>
        <center>Thank you for registering your Pain Diary! <a href = "login.aspx">Login here</a></center>
      </div>
     </asp:panel>
    </div>
  </body>
</html>