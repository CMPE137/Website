<%@ Page Title="Pain Diary - Logout" AutoEventWireup="true" CodeFile="logout.aspx.cs" Inherits="_Default" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Pain Diary - Logout</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
  </head>
  <body>
    <div class="container-fluid">
      <div class = "row">
        <div class = "col-md-6 col-md-offset-3 col-xs-12">
        <h1>Logout</h1>
          Your have been logged out successfully! <br>
          <a href = "login.aspx">Log back in</a>
        </div>
      </div>
    </div>
  </body>
</html>