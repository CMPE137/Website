using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e) {
    	Session.Abandon();
    	return;
      
    }
    
}