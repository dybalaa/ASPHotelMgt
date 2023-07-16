<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HotelMgtLogin.aspx.cs" Inherits="Hotelsystem.HotelMgtLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <style>

        body{
        
            margin-top:100px;
            margin-left:500px;
            
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>

        <h2>For Hotel Management</h2>
         <asp:Label ID="Label1" runat="server" Text="Email Address" Font-Size="35px"></asp:Label><br />
        <asp:TextBox ID="TextBox1" TextMode="Email" runat="server" BorderStyle="Solid"  Width="312px" Height="36px"></asp:TextBox><br/>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox1"
                ErrorMessage="Email Address is required." ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />

        <asp:Label ID="Label2" runat="server" Text="Password" Font-Size="35px"></asp:Label><br />
        <asp:TextBox ID="TextBox2" TextMode="Password" BorderStyle="Solid" runat="server" Width="312px" Height="36px"></asp:TextBox><br/>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox2"
                ErrorMessage="Paasword is required." ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />
        
        
        <input type="checkbox" id="pass" onclick="showpass(this);" />
           Show Password
            <script type="text/javascript">
                function showpass(check_box) {
                    var spass = document.getElementById("TextBox2");
                    if (check_box.checked)
                        spass.setAttribute("type", "text");
                    else
                        spass.setAttribute("type", "password");
                }
           </script>
        <br />
        <br />

        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" Width="120px" Height="46px" Font-Size="25px" />

    </div>
    </form>
</body>
</html>
