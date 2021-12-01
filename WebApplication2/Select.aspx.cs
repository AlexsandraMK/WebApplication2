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
            task1GridView.DataBind();

            // Проверям результат запроса и выводи информацию
            infoLabel.Text = "Результат запроса 1:";
            if (task1GridView.Rows.Count == 0)
                infoLabel.Text = "Данных не найдено.";
        }
    }
}