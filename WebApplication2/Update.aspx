<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Лабораторная работа 8</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <form id="task2Form" runat="server">
        <asp:SqlDataSource ID="vDataSource" runat="server" ConnectionString="Dsn=PostgreSQL30;database=students;server=fpm2.ami.nstu.ru;port=5432;uid=pmi-b8408;sslmode=disable;readonly=0;protocol=7.4;fakeoidindex=0;showoidcolumn=0;rowversioning=0;showsystemtables=0;fetch=100;unknownsizes=0;maxvarcharsize=255;maxlongvarcharsize=8190;debug=0;commlog=0;usedeclarefetch=0;textaslongvarchar=1;unknownsaslongvarchar=0;boolsaschar=1;parse=0;lfconversion=1;updatablecursors=1;trueisminus1=0;bi=0;byteaaslongvarbinary=1;useserversideprepare=1;lowercaseidentifier=0;d6=-101;optionalerrors=0;fetchrefcursors=0;xaopt=1;pwd=Gicbads9"
            ProviderName="System.Data.Odbc" SelectCommand="SELECT pmib8408.j.name,
 v1.date_begin, v1.cost 
FROM pmib8408.v v1
JOIN pmib8408.j ON v1.n_izd = pmib8408.j.n_izd
WHERE v1.n_v = (SELECT pmib8408.v.n_v 
                FROM pmib8408.v
                JOIN pmib8408.q ON pmib8408.q.n_izd=pmib8408.v.n_izd
                WHERE pmib8408.v.n_izd = v1.n_izd
                      AND pmib8408.q.n_det = (SELECt pmib8408.p.n_det
From pmib8408.p
Where pmib8408.p.name = ? And pmib8408.p.cvet = ?)
                ORDER BY pmib8408.v.date_begin DESC
                LIMIT 1)" InsertCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="pDropDownList" DefaultValue="P1" Name="name_det" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="cvetDropDownList" DefaultValue="Зеленый" Name="color" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="pDataSource" runat="server" ConnectionString="Dsn=PostgreSQL30;database=students;server=fpm2.ami.nstu.ru;port=5432;uid=pmi-b8408;sslmode=disable;readonly=0;protocol=7.4;fakeoidindex=0;showoidcolumn=0;rowversioning=0;showsystemtables=0;fetch=100;unknownsizes=0;maxvarcharsize=255;maxlongvarcharsize=8190;debug=0;commlog=0;usedeclarefetch=0;textaslongvarchar=1;unknownsaslongvarchar=0;boolsaschar=1;parse=0;lfconversion=1;updatablecursors=1;trueisminus1=0;bi=0;byteaaslongvarbinary=1;useserversideprepare=1;lowercaseidentifier=0;d6=-101;optionalerrors=0;fetchrefcursors=0;xaopt=1;pwd=Gicbads9"
            ProviderName="System.Data.Odbc" SelectCommand="SELECT distinct name AS name_det FROM pmib8408.p"></asp:SqlDataSource>

        <asp:SqlDataSource ID="cvetDataSource" runat="server" ConnectionString="Dsn=PostgreSQL30;database=students;server=fpm2.ami.nstu.ru;port=5432;uid=pmi-b8408;sslmode=disable;readonly=0;protocol=7.4;fakeoidindex=0;showoidcolumn=0;rowversioning=0;showsystemtables=0;fetch=100;unknownsizes=0;maxvarcharsize=255;maxlongvarcharsize=8190;debug=0;commlog=0;usedeclarefetch=0;textaslongvarchar=1;unknownsaslongvarchar=0;boolsaschar=1;parse=0;lfconversion=1;updatablecursors=1;trueisminus1=0;bi=0;byteaaslongvarbinary=1;useserversideprepare=1;lowercaseidentifier=0;d6=-101;optionalerrors=0;fetchrefcursors=0;xaopt=1;pwd=Gicbads9" ProviderName="System.Data.Odbc" SelectCommand="SELECT DISTINCT cvet AS color FROM students.pmib8408.p"></asp:SqlDataSource>

        <h1>Запрос 2</h1>
        <p class="queryText">
            Для изделий, в состав которых входит заданная деталь,<br />
            сдвинуть на месяц назад дату начала действия последней рекомендованной цены
        </p>
        <div class="query">
            <div class="input">
                <p class="queryText">Выберите деталь:</p>


                    <div class="detInput">

                        <div class="left">
                            <p class="queryText">Название:</p>
                                            <div class="combobox">
                            <asp:DropDownList ID="pDropDownList" runat="server" AutoPostBack="True" DataSourceID="pDataSource" DataTextField="name_det" DataValueField="name_det" Width="200px" HorizontalAlign="Center" Height="16px"  />
                        </div>
                                            </div>
                        <div class="right">
                            <p class="queryText">Цвет:</p>
                            <div class="combobox">
                            <asp:DropDownList ID="cvetDropDownList" runat="server" AutoPostBack="True" DataSourceID="cvetDataSource" DataTextField="color" DataValueField="color" Width="200px" HorizontalAlign="Center"  />
                       </div>
                            </div>
                
            </div>

        </div>
                        <p class="queryText">Последние рекомендованные цены для изделий, в которые входит указанная деталь:<br />
                    <asp:Label ID="infoLabel1" runat="server"></asp:Label> <br />
                    <asp:Label ID="errLabel" runat="server"></asp:Label></p>
            <asp:GridView ID="vGridView" BackColor="White" runat="server" DataSourceID="vDataSource" AutoGenerateColumns="false" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="Название изделия" />
                    <asp:BoundField DataField="date_begin" HeaderText="Дата начала" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false" />
                    <asp:BoundField DataField="cost" HeaderText="Рекомендованная цена" />
                </Columns>
            </asp:GridView>
        <div class="button_block">
            <asp:Button ID="execButton" runat="server" OnClick="execButton_Click" Text="Уменьшить последнюю дату изделия на 1 месяц" />
        </div>
            <p class="queryText"><asp:Label ID="infoLabel" runat="server" Text=""></asp:Label></p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Назад" />
        </div>
    </form>
</body>
</html>
