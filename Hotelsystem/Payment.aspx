<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Hotelsystem.Payment" %>

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
    
          <asp:Label ID="Label1" runat="server" Text="BookingReference" Font-Size="35px"></asp:Label><br />
        <asp:TextBox ID="TextBox1" TextMode="Email" runat="server" BorderStyle="Solid"  Width="312px" Height="36px"></asp:TextBox><br/>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox1"
                ErrorMessage="BookingReference is required." ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />

        <asp:Label ID="Label2" runat="server" Text="Card Number" Font-Size="35px"></asp:Label><br />
        <asp:TextBox ID="TextBox2" BorderStyle="Solid"  runat="server" Width="312px" Height="36px"></asp:TextBox><br/>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox2"
                ErrorMessage="Card Number is requires." ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />
        
        
        <asp:Label ID="Label3" runat="server" Text="Expiry Date" Font-Size="35px"></asp:Label><br />
        <asp:TextBox ID="TextBox3" BorderStyle="Solid" Placeholder="DD/MM" runat="server" Width="312px" Height="36px"></asp:TextBox><br/>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox2"
                ErrorMessage="Expiry date is required." ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />
        
        <asp:Label ID="Label4" runat="server" Text="Amount" Font-Size="35px"></asp:Label><br />
        <asp:TextBox ID="TextBox4" BorderStyle="Solid" runat="server" Width="312px" Height="36px"></asp:TextBox><br/>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox2"
                ErrorMessage="Enter amount." ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />
        
                <asp:Button ID="Button1" runat="server" Text="Confirm" Width="120px" Height="46px" Font-Size="25px" />

    </div>
    </form>
</body>
</html>
