<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GSTIN_Validation.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.8.2.js"></script>
     <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
   
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox runat="server" ID="txtGSTIN" />
        <asp:Button Text="Search" runat="server" ID="btnCheckValidGSTIN" OnClick="btnCheckValidGSTIN_Click" />
        <asp:Label Text="" ID="lblMsg" runat="server" />
        <asp:FileUpload runat="server" ID="fuExcel" />
        <asp:Button runat="server" ID="btnUpload"  Text="Upload" />
        <asp:TextBox runat="server" ID="TextBox1" />

        <asp:TextBox runat="server" ID="TextBox2" />

        <asp:Button runat="server" ID="Button1" OnClick="Button1_Click" Text="Upload" />


    </div>
        <div style="width:100%">
            <h2>Table</h2>
            <asp:GridView runat="server" ID="grd" AutoGenerateColumns="true"></asp:GridView>
            <asp:Button runat="server" ID="btnSave" Text="Add" OnClick="btnSave_Click" />
        </div>
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

           <asp:FileUpload runat="server" ID="FileUpload1" />
        <asp:Button runat="server" ID="Button2" OnClick="Button2_Click"  Text="Upload" />
    </form>
</body>
</html>
