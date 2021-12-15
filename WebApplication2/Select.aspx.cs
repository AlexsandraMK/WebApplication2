using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void execButton_Click(object sender, EventArgs e)
        {
            // Обновляем значение GridView
            task1GridView.DataSourceID = "Query1";
            try {
                errLabel.Text = "";
                task1GridView.DataBind();
            }
            catch (Exception )
            { 
                errLabel.Text = "Ошибка в выполнении запроса";
                task1GridView.DataSourceID = "";
            }

            
            infoLabel.Text = "Результат запроса 1:";
            
            if (task1GridView.Rows.Count == 0 && errLabel.Text=="")  // Если запрос вернул 0 строк
                infoLabel.Text = "Данных не найдено.";
            else
                infoLabel.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Main.aspx");   // Переходим на главное окно
        }
    }
}