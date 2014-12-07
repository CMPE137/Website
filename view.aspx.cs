using System;
using System.Text;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Security.Cryptography;
using MySql.Data.MySqlClient;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e) {
      if(String.IsNullOrEmpty((String)Session["userId"])) {
      	Server.Transfer("login.aspx");
        return;
      }

       string connectionString = "Server=localhost;Database=paindiaries;User ID=root;Password=paindiaries;Pooling=false;";
       MySqlConnection dbcon = new MySqlConnection(connectionString);
       dbcon.Open();

       MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT date as 'Date',area as 'Area',duration as 'Duration',intensity as 'Intensity' FROM entries WHERE owner = '" + Session["userId"] + "'", dbcon);
       DataSet ds = new DataSet();
       adapter.Fill(ds, "result");

       dbcon.Close();
       dbcon = null;

       UsersControl.DataSource = ds.Tables["result"];
       UsersControl.DataBind();
    }
    
}