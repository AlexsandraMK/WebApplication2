<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="WebApplication2.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="style.css" />
    <title>Лабораторная работа 8</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="mainWindow">
            <div class="left">
                <asp:Button ID="Button1" runat="server" Text="Получить информацию о рекомендованной цене на указанное
изделие на заданную дату" CssClass="wrap" OnClick="Button1_Click"  />
            </div>
            <div class="right">
                <asp:Button ID="Button2" runat="server" Text="Для изделий, в состав которых входит заданная деталь, сдвинуть 
на месяц назад дату начала действия последней рекомендованной цены" CssClass="wrap" OnClick="Button2_Click" />
            </div>
        </div>
    </form>
</body>
</html>
