<%@ Page Title="Pain Diary - Your Diary" AutoEventWireup="true" CodeFile="view.aspx.cs" Inherits="_Default" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Pain Diary - Your Diary</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <style>
      body { padding-top: 50px; }
    </style>
  </head>
  <body>

    <div class="container-fluid">
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
          <div class="row">
            <div class = "col-md-3 col-md-offset-2">
              <a href = "newEntry.aspx"><button type="button" class="btn btn-success navbar-btn">New Entry</button></a>
           </div>            
           <div class = "col-md-3 col-md-offset-4">
              <a href = "logout.aspx"><button type="button" class="btn btn-danger navbar-btn">Logout</button></a>
            </div>
          </div>
        </nav>
      <div class = "row">
        <div class = "col-md-5 col-md-offset-2 col-xs-12">
          <h1>Your Diary</h1>




        </div>
      </div>
    </div>
  </body>
</html>