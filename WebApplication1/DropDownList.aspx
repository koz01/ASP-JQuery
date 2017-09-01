<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DropDownList.aspx.cs" Inherits="WebApplication1.DropDownList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var classDDL = $('#Class');
            var CategoryDDL = $('#Category');
            var BookDDL = $('#Book');

            $.ajax({
                url: 'WebService1.asmx/getClass',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    classDDL.append($('<option/>', { value: -1, text: 'Select Class Name' }));
                    CategoryDDL.append($('<option/>', { value: -1, text: 'Select Category' }));
                    BookDDL.append($('<option/>', { value: -1, text: 'Select Book' }));
                    CategoryDDL.prop('disabled', true);
                    BookDDL.prop('disabled', true);

                    $(data).each(function (index, item) {
                        classDDL.append($('<option/>', { value: item.ClassID, text: item.ClassName }));
                    });
                }
            });

        })
    </script>

    <style>
        select{
            width: 150px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <table>
        <tr>
            <td>
                Class
            </td>
            <td>
                <select id="Class"></select>
            </td>
        </tr>

        <tr>
            <td>
                Category
            </td>
            <td>
                <select id="Category"></select>
            </td>
        </tr>

          <tr>
            <td>
                Book
            </td>
            <td>
                <select id="Book"></select>
            </td>
        </tr>

    </table>
    </form>
</body>
</html>
