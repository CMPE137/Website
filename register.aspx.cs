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
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    static string GetMd5Hash(MD5 md5Hash, string input) {
            // Convert the input string to a byte array and compute the hash. 
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes 
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data  
            // and format each one as a hexadecimal string. 
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string. 
            return sBuilder.ToString();
    }

    protected void registerClick (Object sender, EventArgs e) {
       errorMsgIncompleteForm.Visible = false;
       errorMsgMailInUse.Visible = false;
       successMsg.Visible = false;

       string connectionString = "Server=localhost;Database=paindiaries;User ID=root;Password=paindiaries;Pooling=false;";
       MySqlConnection dbcon = new MySqlConnection(connectionString);
       dbcon.Open();

       MD5 hash = MD5.Create();

       string passwordHash = GetMd5Hash(hash, inputPassword.Value);

       MySqlCommand checkCommand = dbcon.CreateCommand();
       checkCommand.CommandText = "SELECT * FROM users WHERE email LIKE '" + inputEmail.Value + "';";
       Object returnValue = checkCommand.ExecuteScalar();

       if(returnValue != null) {
          errorMsgMailInUse.Visible = true;
          dbcon.Close();
          dbcon = null; 
          return;
       } else if (inputEmail.Value == "" || inputPassword.Value == "" || inputFirstname.Value == "" ||inputLastname.Value == "" || inputDate.Value == "" || inputGender.Value == "") {
          errorMsgIncompleteForm.Visible = true;
          dbcon.Close();
          dbcon = null; 
          return;
       }

       MySqlCommand command = dbcon.CreateCommand();
       command.CommandText = "INSERT INTO `paindiaries`.`users` (`email`, `password`, `firstname`, `lastname`, `dob`, `gender`) VALUES ('" + inputEmail.Value + "', '" + passwordHash + "', '" + inputFirstname.Value + "', '" + inputLastname.Value + "', '" + inputDate.Value + "', '" + inputGender.Value + "');";
       command.ExecuteNonQuery();

       successMsg.Visible = true;

       dbcon.Close();
       dbcon = null; 
    }

    
}