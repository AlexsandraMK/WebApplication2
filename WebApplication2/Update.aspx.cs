using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void execButton_Click(object sender, EventArgs e)
        {
            // Создание объекта подключения
            OdbcConnection connection = new OdbcConnection();
            // Задание параметра подключения – имя ODBC-источника
            connection.ConnectionString = vDataSource.ConnectionString;
            // Подключение к базе данных
            connection.Open();

            string query_text = "UPDATE pmib8408.v v1 SET date_begin = date_begin - interval '1 month' WHERE v1.n_v = (SELECT pmib8408.v.n_v FROM pmib8408.v JOIN pmib8408.q ON pmib8408.q.n_izd = pmib8408.v.n_izd WHERE pmib8408.v.n_izd = v1.n_izd AND pmib8408.q.n_det = (SELECt pmib8408.p.n_det FROM pmib8408.p WHERE pmib8408.p.name = ? AND pmib8408.p.cvet = ?) ORDER BY pmib8408.v.date_begin DESC LIMIT 1);";

            // Создание объекта запроса
            OdbcCommand command = new OdbcCommand(query_text, connection);

            // Создание параметра запроса
            OdbcParameter parameter1 = new OdbcParameter();
            parameter1.ParameterName = "@name_det";
            parameter1.OdbcType = OdbcType.Text;
            parameter1.Value = pDropDownList.SelectedItem.Value;
            // Добавление параметра к запросу
            command.Parameters.Add(parameter1);

            OdbcParameter parameter2 = new OdbcParameter();
            parameter2.ParameterName = "@color";
            parameter2.OdbcType = OdbcType.Text;
            parameter2.Value = cvetDropDownList.SelectedItem.Value;
            // Добаавление параметра к запросу
            command.Parameters.Add(parameter2);

            // Объявление объекта транзакции
            OdbcTransaction transaction = null;

            try
            {
                // Начало транзакции и извлечение объекта транзакции из объекта подключения
                transaction = connection.BeginTransaction();

                // Включение объекта SQL-команды в транзакцию
                command.Transaction = transaction;
                // Выполнение SQL-команды и получение количества обработанных записей
                infoLabel.Text = "Записей обработано: " + command.ExecuteNonQuery().ToString();

                // Подтверждение транзакции  
                transaction.Commit();
                // Обновление gridView
                vGridView.DataBind();
            }
            catch (Exception exception)
            {
                // Формирование и вывод сообщения об ошибке
                infoLabel.Text = exception.Message;

                // Откатывание транзакции
                transaction.Rollback();
            }

            // Завершение соединения
            connection.Close();
        }
    }
}