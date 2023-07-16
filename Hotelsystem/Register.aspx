<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Hotelsystem.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-top:30px;">
    
          <div style="width:32%; height:400px;float:left;margin-left:150px">
            
            <img src="images/register 2.jpg" style="width: 392px; height: 372px; margin-left: 11px; margin-top: 11px" />

          </div>


           <div style="width:40%; height:600px; float:left; margin-left:10px">

                <asp:Label ID="Label1" runat="server" Text="Email address" Font-Size="30px"></asp:Label><br />
        <asp:TextBox ID="TextBox1" TextMode="Email" runat="server" OnTextChanged="onEmailCheck" AutoPostBack="true" Width="320px" Height="36px" BorderStyle="Solid"></asp:TextBox>
        <br/>
                <asp:Label ID="lblMessage" ForeColor="Red" Text="" runat="server" /><br />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox1"
                ErrorMessage="Email Address is required." ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />


        <asp:Label ID="Label2" runat="server" Text="Username" Font-Size="30px"></asp:Label><br />
        <asp:TextBox ID="TextBox2" runat="server" Width="320px" Height="36px" BorderStyle="Solid"></asp:TextBox><br/>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox2"
                ErrorMessage="Username is required." ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />

        <asp:Label ID="Label3" runat="server" Text="Password" Font-Size="30px"></asp:Label><br />
        <asp:TextBox ID="TextBox3" runat="server" Width="320px" Height="36px" BorderStyle="Solid"></asp:TextBox><br/>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox3"
                ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />

        <asp:Label ID="Label4" runat="server" Text="Comfirm Password" Font-Size="30px"></asp:Label><br />
        <asp:TextBox ID="TextBox4" runat="server" Width="320px" Height="36px" BorderStyle="Solid"></asp:TextBox><br/>

        <asp:CompareValidator runat="server" ControlToCompare="Textbox3" ControlToValidate="Textbox4"
                ErrorMessage="Passwords do not match." ForeColor="Red" Display="Dynamic">
            </asp:CompareValidator><br />


         <asp:CheckBox ID="CheckBox1" runat="server" CssClass="auto-style5" Text="I accept the Terms of Use &amp; Privacy Policy" /> <br />
               <br />

        <asp:Button ID="BtnRegister" runat="server" Font-Size="25px" Text="Register" OnClick="Button1_Click" Width="162px" Height="46px" />
        <p>Do you want to cancel <a href="home2.aspx">Cancel</a></p>

           </div>
           

    </div>
    </form>
</body>
</html>
