<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="Hotelsystem.Booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        body{
      background-image: url('images/bg.jpg');
      background-repeat: no-repeat;
      background-size: cover;
        }

    </style>

</head>

<body>
    <form id="form1" runat="server">
    
    <div style="margin-left:500px; margin-top:20px">

        <asp:Label ID="Label1" runat="server" Text="<strong>No Of Adults</strong>" Font-Size="30px"></asp:Label><br/>
        <asp:DropDownList ID="DropdownList1" runat="server" Width="314px" BorderStyle="Solid" Height="36px">
                        <asp:ListItem Value="0">0</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
        </asp:DropDownList><br />
         <asp:RequiredFieldValidator runat="server" ControlToValidate="DropdownList1"
                ErrorMessage="Required" ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />

        <asp:Label ID="Label2"  runat="server" Text="<strong>No of Children</strong>" Font-Size="30px"></asp:Label><br/>
        <asp:DropDownList ID="DropdwonList2"  runat="server" Width="314px" Height="36px" BorderStyle="Solid" >
                       <asp:ListItem Value="0">0</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
        </asp:DropDownList><br/>
         <asp:RequiredFieldValidator runat="server" ControlToValidate="DropdwonList2"
                ErrorMessage="Required" ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />

       <asp:Label ID="Label3"  runat="server" Text="<strong>Check In</strong>" Font-Size="30px"></asp:Label><br/>
        <asp:TextBox ID="TextBox6" TextMode="Date" runat="server" Width="314px" Height="36px" BorderStyle="Solid"></asp:TextBox><br />
         <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox6"
                ErrorMessage="Required" ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />

        <asp:Label ID="Label4"  runat="server" Text="<strong>Check Out</strong>" Font-Size="30px"></asp:Label><br/>
        <asp:TextBox ID="TextBox5" TextMode="Date" runat="server" Width="314px" Height="36px" BorderStyle="Solid"></asp:TextBox><br />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox5"
                ErrorMessage="Required" ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />

        <asp:Label ID="Label5"  runat="server" Text="<strong>Room</strong>" Font-Size="30px"></asp:Label><br/>
        <asp:DropDownList ID="DropDownList5" runat="server" BorderStyle="Solid" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged" AutoPostBack="true" Width="314px" Height="36px">
           <asp:ListItem Text="---Select Room---"></asp:ListItem>
        </asp:DropDownList><br/>
         <asp:RequiredFieldValidator runat="server" ControlToValidate="DropdownList5"
                ErrorMessage="Required" ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />

         <asp:Label ID="Label6"  runat="server" Text="<strong>Rate</strong>" Font-Size="30px"></asp:Label><br/>
        <asp:DropDownList ID="DropDownList6" runat="server" Width="314px" Height="36px" BorderStyle="Solid">
            <asp:ListItem Text="---Select Rate---"></asp:ListItem>
        </asp:DropDownList><br />
         <asp:RequiredFieldValidator runat="server" ControlToValidate="DropdownList6"
                ErrorMessage="Required" ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />

        <asp:Label ID="Label11" runat="server" Text="<strong></strong>"></asp:Label><br />

        <asp:Label ID="Label7" runat="server" Text="<strong>Full Name</strong>" Font-Size="30px"></asp:Label><br/>
        <asp:TextBox ID="TextBox1" runat="server" Width="314px" Height="36px" BorderStyle="Solid"></asp:TextBox><br />
          <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox1"
                ErrorMessage="Required" ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />

        <asp:Label ID="Label8" runat="server" Text="<strong>Phone Number</strong>" Font-Size="30px"></asp:Label><br/>
        <asp:TextBox ID="TextBox2" runat="server" Width="314px" Height="36px" BorderStyle="Solid"></asp:TextBox><br/>
          <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox2"
                ErrorMessage="Required" ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />
        
        <asp:Label ID="Label9" runat="server" Text="<strong>Email Address</strong>" Font-Size="30px"></asp:Label><br/>
        <asp:TextBox ID="TextBox3" runat="server" Width="314px" Height="36px" BorderStyle="Solid"></asp:TextBox><br/>
          <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox3"
                ErrorMessage="Required" ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />

        <asp:Label ID="Label10" runat="server" Text="<strong>BookingReference</strong>" Font-Size="30px"></asp:Label><br/>
        <asp:TextBox ID="TextBox4" runat="server" Width="314px" Height="36px" ReadOnly="true" BorderStyle="Solid"></asp:TextBox>
        <asp:Label ID="Label12" runat="server" Text="This is autogenerated. Continue to save"></asp:Label>
        <br/>

        <asp:Button ID="Button1" runat="server" Text="Continue" Width="120px" Height="46px" Font-Size="25px" OnClick="Button1_Click" /><br />

        <p><strong>Do you want to cancel <a href="home2.aspx">Cancel</a></strong></p>



       
    </div>  
    </form>
</body>
</html>
