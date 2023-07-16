<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Hotelsystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
   
 
</head>
<body>
    <form id="form1" runat="server">

        

    <div  style="margin-top:100px;">
       
           <h2 style="text-align:center">For Clients Only</h2>

        <div style="width:32%; height:300px;float:left; margin-left:150px">

            <img src="images/login.jpg" style="width:435px; height: 285px; margin-left: 0px;" />

        </div>
           <div style="width:40%; height:400px; float:left;  margin-left:10px">

                <asp:Label ID="Label1" runat="server" Text="Username" Font-Size="35px"></asp:Label><br />
        <asp:TextBox ID="TextBox1" BorderStyle="Solid" runat="server" Width="312px" Height="36px"></asp:TextBox><br/>

         <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox1"
                ErrorMessage="Username is required" ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator><br />

        <asp:Label ID="Label2" runat="server" Text="Password" Font-Size="35px"></asp:Label><br />
        <asp:TextBox ID="TextBox2" TextMode="Password"  BorderStyle="Solid" runat="server" Width="312px" Height="36px" style="margin-bottom: 22px"></asp:TextBox>
               <asp:Label ID="Label3" runat="server" Text="" Font-Size="20px" ForeColor="Red"></asp:Label>
               <br/>

         <asp:RequiredFieldValidator runat="server" ControlToValidate="Textbox2"
                ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator>
               <br />

         
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
             
        <asp:Button ID="Button1" runat="server" BorderStyle="Solid" Text="Login" Font-Size="25px"  OnClick="Button1_Click" Width="120px" Height="46px" /><br />
        <a href="Register.aspx">Register</a><br />
         <asp:Button ID="Button3" runat="server" Text="Cancel" Width="190px" Height="46px" OnClick="Button3_Click"  />

           </div>

       
    </div>
    </form>
</body>
</html>
