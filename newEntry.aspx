<%@ Page Title="Pain Diary - New entry" AutoEventWireup="true" CodeFile="newEntry.aspx.cs" Inherits="_Default" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Pain Diary - New entry</title>
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
          <h1>Submit new data</h1>
          <form runat = "server">
          <table class="table table-condensed" width = "100%">
            <tbody>
              <tr>
                <td><h4>Where does it hurt?</h4></td>
                  <td>
                    <center><img src = "body.png" height = "200" id = "bodyimg"></center><br><br>
                      <select id = "body_part" runat = "server" onchange=change(this.value) class = "form-control">
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
                  Doesn't Hurt<input type = "range" value = "0" id = "pain_range" class = "form-control" width = "50%">Very Much 
                  <asp:HiddenField ID="painInput" runat="server" />
                </td>
              </tr>
              <tr>
                <td><h4>How long has it hurt?</h4></td>
                <td>
                  <select class = "form-control" runat = "server" id ="durationInput">
                 <option value="1hr"> 1 Hour</option>
                 <option value="1-2hrs">1-2 Hours</option>
                 <option value="3-4hrs">3-4 Hours</option>
                 <option value="4+hrs">4 Hours +</option>
              </select>
                </td>
              </tr>
              <tr>
                <td><h4>What day was this?</h4></td>
                <td><input type="text" class="form-control" id="inputDate" runat = "server" onclick="scwShow(this, event);"></td>
              </tr>
            </tbody>
          </table>
          <center><asp:button type="submit" class="btn btn-primary" runat = "server" id = "submitButton" onClick = "submitClick" text = "Submit" width = "70%"/> </center>
          </form>
        <asp:panel>
          <div class = "row" id = "errorMsgIncompleteForm" runat = "server" visible = false>
            <center>Please fill out the entire form!</center>
          </div>
        </asp:panel>
        </div>
      </div>
    </div>
  </body>
  <script>

var body_part = "Head"
setInterval("update()",1)

function update()
{
var pain = document.getElementById("pain_range").value;
document.getElementById("painInput").value = pain;

if (body_part == "Head")
setHead()
if (body_part == "Shoulders")
setShoulders()
if (body_part == "Knees")
setKnees()
if (body_part == "Toes")
setToes()
}

function change(bodypart) {
  body_part = bodypart;
}

function setHead()
{
document.getElementById("bodyimg").src = "body_head.png"
if (document.getElementById("pain_range").value > 40)
document.getElementById("bodyimg").src = "body_head2.png"
if (document.getElementById("pain_range").value > 70)
document.getElementById("bodyimg").src = "body_head3.png"

body_part = "Head"
}
function setShoulders()
{
document.getElementById("bodyimg").src = "body_shoulders.png"
if (document.getElementById("pain_range").value > 40)
document.getElementById("bodyimg").src = "body_shoulders2.png"
if (document.getElementById("pain_range").value > 70)
document.getElementById("bodyimg").src = "body_shoulders3.png"

body_part = "Shoulders"
}
function setKnees()
{
document.getElementById("bodyimg").src = "body_knees.png"
if (document.getElementById("pain_range").value > 40)
document.getElementById("bodyimg").src = "body_knees2.png"
if (document.getElementById("pain_range").value > 70)
document.getElementById("bodyimg").src = "body_knees3.png"

body_part = "Knees"
}
function setToes()
{
document.getElementById("bodyimg").src = "body_toes.png"
if (document.getElementById("pain_range").value > 40)
document.getElementById("bodyimg").src = "body_toes2.png"
if (document.getElementById("pain_range").value > 70)
document.getElementById("bodyimg").src = "body_toes3.png"

body_part = "Toes"
}
</script>
</html>