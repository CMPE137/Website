<%@ Page Title="Pain Diary - View Entry" AutoEventWireup="true" CodeFile="view_entry.aspx.cs" Inherits="_Default" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Pain Diary - View Entry</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <script type='text/JavaScript' src='scw.js'></script>
    <style>
      body { padding-top: 50px; }
    </style>
  </head>
  <body>

    <div class="container-fluid">
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
          <div class="row">
            <div class = "col-md-3 col-md-offset-2">
              <a href = "view.aspx"><button type="button" class="btn btn-success navbar-btn">Your Diary</button></a>
           </div>          
           <div class = "col-md-3 col-md-offset-4">
              <a href = "logout.aspx"><button type="button" class="btn btn-danger navbar-btn">Logout</button></a>
            </div>
          </div>
        </nav>
      <div class = "row">
        <div class = "col-md-8 col-md-offset-2 col-xs-12">
          <h1>View Your Entry</h1>
          <form runat = "server">
          <table class="table table-condensed" width = "100%">
            <tbody>
              <tr>
                <td width="400px;"><h4>Where does it hurt?</h4></td>
                  <td>
                    <center><img src = "body.png" height = "200" id = "bodyimg"><asp:HiddenField ID="bodyImage" runat="server" /></center><br><br>
                      <select id = "body_part" runat = "server" onchange=change(this.value) class = "form-control" disabled="disabled">
                        <option value="Head">Head</option>
                        <option value="Shoulders">Shoulders</option>
                        <option value="Knees">Knees</option>
                        <option value="Toes">Toes</option>
                      </select> 
                </td>
              </tr>
              <tr>
                <td><h4>How much does it hurt?</h4></td>
                <td>
                  <img style="float:left; margin-right:5px;" width="32px" src="happy.png"/><input style="width:285px; float:left;" type = "range" value = "0" id = "pain_range" class = "form-control" disabled="disabled"><img style="float:left; margin-left:5px;" width="32px" src="sad.png"/> 
                  <asp:HiddenField ID="painInput" runat="server" />
                </td>
              </tr>
              <tr>
                <td><h4>How long has it hurt?</h4></td>
                <td>
                  <select class = "form-control" runat = "server" id ="durationInput" disabled="disabled">
                 <option value="< 1 Hour">< 1 Hour</option>
                 <option value="1-2 Hours">1-2 Hours</option>
                 <option value="3-4 Hours">3-4 Hours</option>
                 <option value="4+ Hours">4 Hours +</option>
              </select>
                </td>
              </tr>
              <tr>
                <td><h4>What day was this?</h4></td>
                <td><input disabled="disabled" type="text" class="form-control" id="inputDate" runat = "server" onclick="scwShow(this, event);"></td>
              </tr>
            </tbody>
          </table>
          </form>
        </div>
      </div>
    </div>
  </body>
  <script>
  	var interval = setInterval(function(){
		var painInput = document.getElementById('painInput').value;
		document.getElementById('pain_range').value = painInput;
		
		var bi = document.getElementById('bodyImage').value;
		document.getElementById('bodyimg').src = bi;
		
		if(painInput>0)clearInterval(interval);
	}, 50);
  </script>
</html>