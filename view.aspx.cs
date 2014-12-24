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
		
		if (!string.IsNullOrEmpty(Request.QueryString["action"])) {
			if(Request.QueryString["action"].ToString()=="delete") {
				string entryID = Request.QueryString["id"].ToString();
				MySqlCommand command = dbcon.CreateCommand();
				command.CommandText = "DELETE FROM entries WHERE id='"+entryID+"'";
				if(command.ExecuteNonQuery()>0) {
					deleteMsg.Visible = true;
				}
			}
		}

		MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT id, DATE_FORMAT(date, '%W %b %d, %Y') as 'Date',area as 'Area',duration as 'Duration',intensity as 'Intensity' FROM entries WHERE owner = '" + Session["userId"] + "' ORDER BY date DESC", dbcon);
		DataTable wt = new DataTable();
		DataTable dt = new DataTable();
		adapter.Fill(wt);
		adapter.Fill(dt);
		dt.Columns.Remove("id");
		dt.Columns.Add("Action");
		
		for(int i=0;i<dt.Rows.Count;i++) {
			DataRow wtr = wt.Rows[i];
			DataRow dtr = dt.Rows[i];
			dtr["Area"] = UppercaseFirst(dtr["Area"].ToString());
			dtr["Action"] = "<a href='view_entry.aspx?id="+wtr["id"]+"'>View Entry</a> | <a href='view.aspx?id="+wtr["id"]+"&action=delete'>Delete</a>";
		}
	   
       	dbcon.Close();
       	dbcon = null;

       	UsersControl.DataSource = dt;
       	UsersControl.DataBind();
    }
	
	static string UppercaseFirst(string s) {
		// Check for empty string.
		if (string.IsNullOrEmpty(s))
		{
			return string.Empty;
		}
		// Return char and concat substring.
		return char.ToUpper(s[0]) + s.Substring(1);
    }
	
}