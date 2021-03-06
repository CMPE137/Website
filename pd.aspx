<% @Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>CD cat</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

    <script runat="server">
    private void Page_Load(Object sender, EventArgs e)
    {
       string connectionString = "Server=localhost;Database=paindiaries;User ID=root;Password=paindiaries;Pooling=false;";
       MySqlConnection dbcon = new MySqlConnection(connectionString);
       dbcon.Open();

       MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM users", dbcon);
       DataSet ds = new DataSet();
       adapter.Fill(ds, "result");

       dbcon.Close();
       dbcon = null;

       UsersControl.DataSource = ds.Tables["result"];
       UsersControl.DataBind();
    }
    </script>

  </head>

  <body>
    <h1>Users</h1>
    <asp:DataGrid runat="server" id="UsersControl" class = "table table-striped"/>
  </body>

</html>