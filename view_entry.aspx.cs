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
		
		if (!string.IsNullOrEmpty(Request.QueryString["id"])) {
			string entryID = Request.QueryString["id"].ToString();
			MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT DATE_FORMAT(date, '%Y-%m-%d') as 'Date',area,duration,intensity FROM entries WHERE id = '" + entryID + "'", dbcon);
			DataTable dt = new DataTable();
			adapter.Fill(dt);
			DataRow dtr = dt.Rows[0];
			body_part.Value = UppercaseFirst(dtr["area"].ToString());
			painInput.Value = dtr["intensity"].ToString();
			durationInput.Value = dtr["duration"].ToString();
			inputDate.Value = dtr["Date"].ToString();
			
			string bi = "body_"+dtr["area"].ToString();
			int intensity = Int32.Parse(dtr["intensity"].ToString());
			if(intensity>33 && intensity<=66) bi = bi+"2";
			else if(intensity>66) bi = bi+"3";
			bi = bi+".png";
			bodyImage.Value = bi;
		}
		else {
			Server.Transfer("view.aspx");
			return;
		}
	  
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