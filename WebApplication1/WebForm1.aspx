<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <link href="Scripts/jquery-ui.css" rel="stylesheet" />
    <link href="Scripts/jquery.datetimepicker.min.css" rel="stylesheet" />
    <script src="Scripts/jquery.datetimepicker.full.js"></script>
    <style type="text/css">
        .Row {
            background-color:silver;
            }
            .AlternateRow {
            background-color:white;
            }

        Highlight {
        background-color:navy;
        color:white;
        font-weight:bold;
    }

    </style>

    <script type="text/javascript">

        $(document).ready(function () {
            $("#txtName").autocomplete(
                {
                    source: 'BookHandler.ashx'
            });
        });

        $(document).ready(function () {
            $("#txtDate").datepicker({
                appendText: "dd/mm/yyyy",
                showOn: 'both',
                buttonText: 'Calendar',
                dateFormat: 'dd/mm/yy',
                numberOfMonths: 2
            });
        });

        $(document).ready(function () {
            $("#txtDateTime").datetimepicker({
                showOn: 'both'
            });
        });


            
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            Book Name:
            <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static"></asp:TextBox>
       </div>

        Date:
        <asp:TextBox ID="txtDate" runat="server" ClientIDMode="Static"></asp:TextBox>

         DateTime:
        <asp:TextBox ID="txtDateTime" runat="server" ClientIDMode="Static"></asp:TextBox>
    <div>
           
        <asp:GridView ID="GridView1" runat="server" SelectMethod="GridView1_GetData"
            ItemType="WebApplication1.Model.Book">
        <Columns>
        <asp:TemplateField HeaderText="Book Details">
        <ItemTemplate>
        <div>#<%# Item.BookID %></div>
        <asp:Label ID="Label1" runat="server" Text="<%# Item.BookName %>"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="<%# Item.Author %>"></asp:Label>
        <p>
        <%# Item.BookCode %>
        </p>
        </ItemTemplate>
        </asp:TemplateField>
        </Columns>
        <RowStyle CssClass="Row" />
        <AlternatingRowStyle CssClass="AlternateRow" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
