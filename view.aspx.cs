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
    
}