<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Select.aspx.cs" Inherits="WebApplication2.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Лабораторная работа 8</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <form id="task1Form" runat="server">
        <asp:SqlDataSource ID="Query1" runat="server"
            ConnectionString="Dsn=PostgreSQL30;database=students;server=fpm2.ami.nstu.ru;port=5432;uid=pmi-b8408;sslmode=disable;readonly=0;protocol=7.4;fakeoidindex=0;showoidcolumn=0;rowversioning=0;showsystemtables=0;fetch=100;unknownsizes=0;maxvarcharsize=255;maxlongvarcharsize=8190;debug=0;commlog=0;usedeclarefetch=0;textaslongvarchar=1;unknownsaslongvarchar=0;boolsaschar=1;parse=0;lfconversion=1;updatablecursors=1;trueisminus1=0;bi=0;byteaaslongvarbinary=1;useserversideprepare=1;lowercaseidentifier=0;d6=-101;optionalerrors=0;fetchrefcursors=0;xaopt=1;pwd=Gicbads9"
            ProviderName="System.Data.Odbc"
            SelectCommand="SELECT name, date_begin, cost FROM pmib8408.v JOIN pmib8408.j ON pmib8408.v.n_izd = pmib8408.j.n_izd WHERE pmib8408.j.name =? AND pmib8408.v.date_begin &lt;= ? ORDER BY pmib8408.v.date_begin DESC LIMIT 1;">
            <SelectParameters>
                <asp:ControlParameter ControlID="jDropDownList" DefaultValue="Жесткий диск" Name="name_izd" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="beginDateCalendar" DefaultValue="2011-06-01" Name="date_begin" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="Select_n_izd" runat="server"
            ConnectionString="Dsn=PostgreSQL30;database=students;server=fpm2.ami.nstu.ru;port=5432;uid=pmi-b8408;sslmode=disable;readonly=0;protocol=7.4;fakeoidindex=0;showoidcolumn=0;rowversioning=0;showsystemtables=0;fetch=100;unknownsizes=0;maxvarcharsize=255;maxlongvarcharsize=8190;debug=0;commlog=0;usedeclarefetch=0;textaslongvarchar=1;unknownsaslongvarchar=0;boolsaschar=1;parse=0;lfconversion=1;updatablecursors=1;trueisminus1=0;bi=0;byteaaslongvarbinary=1;useserversideprepare=1;lowercaseidentifier=0;d6=-101;optionalerrors=0;fetchrefcursors=0;xaopt=1;pwd=Gicbads9"
            ProviderName="System.Data.Odbc" SelectCommand="SELECT name AS name_izd FROM pmib8408.j"></asp:SqlDataSource>

        <h1>Запрос 1</h1>
        <p class="queryText">Получить информацию о рекомендованной цене на указанное изделие на заданную дату.</p>
        <div class="query">
            <div class="input">
                <div class="left">
                    <p class="queryText">Выберите изделие:</p>
                    <div class="combobox">
                        <asp:DropDownList ID="jDropDownList" runat="server" DataSourceID="Select_n_izd" DataTextField="name_izd" DataValueField="name_izd" Width="200px" HorizontalAlign="Center"></asp:DropDownList>
                    </div>
                </div>
                <div class="right">
                    <p class="queryText">Выберите дату:</p>
                    <div class="calendar_block">
                        <asp:Calendar ID="beginDateCalendar" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana"
                            Font-Size="9pt" ForeColor="Black" Height="190px" Width="350px" VisibleDate="2011-01-01">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#B03B21" ForeColor="White" />
                            <TitleStyle BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" Font-Bold="True" Font-Size="12pt" ForeColor="#B03B21" />
                            <TodayDayStyle BackColor="White" Wrap="True" />
                        </asp:Calendar>
                    </div>
                </div>
            </div>
            <div class="button_block">
                <asp:Button ID="execButton" runat="server" OnClick="execButton_Click" Text="Показать информацию о рекомендованной цене" />
            </div>
            <div class="output">
                <p class="queryText">
                    <asp:Label ID="infoLabel" runat="server" Text=""></asp:Label> <br />
                    <asp:Label ID="errLabel" runat="server"></asp:Label></p>
                <asp:GridView ID="task1GridView" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" >
                    <Columns>
                    <asp:BoundField DataField="name" HeaderText="Название изделия" />
                    <asp:BoundField DataField="date_begin" HeaderText="Дата начала" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false" />
                    <asp:BoundField DataField="cost" HeaderText="Рекомендованная цена" />
                </Columns>
                </asp:GridView>
            </div>
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Назад" />
    </form>
</body>
</html>
