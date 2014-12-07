using System;
using System.Text;
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
    }

    protected void submitClick(object sender, EventArgs e) {
       errorMsgIncompleteForm.Visible = false;

       string connectionString = "Server=localhost;Database=paindiaries;User ID=root;Password=paindiaries;Pooling=false;";
       MySqlConnection dbcon = new MySqlConnection(connectionString);
       dbcon.Open();

       if (body_part.Value == "" || durationInput.Value == "" || inputDate.Value == "") {
       		errorMsgIncompleteForm.Visible = true;
          	dbcon.Close();
          	dbcon = null; 
          	return;
       } 

       int value;
       Int32.TryParse(painInput.Value, out value);
       MySqlCommand command = dbcon.CreateCommand();
       command.CommandText = "INSERT INTO `paindiaries`.`entries` (`owner`, `intensity`, `area`, `date`, `duration`) VALUES ('" + Session["userId"] + "', '" + value + "', '" + body_part.Value + "', '" + inputDate.Value + "', '" + durationInput.Value + "');";
       command.ExecuteNonQuery();

       dbcon.Close();
       dbcon = null; 
    }
    
}