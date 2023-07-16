<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking2.aspx.cs" Inherits="Hotelsystem.Booking2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background:url(images/bg.jpg)">
    <form id="form1" runat="server">
    <div>

    <div>

       

    </div>
        <div style="width:32%; float:left">

            <h1>Reservation Info</h1>
             
            <h2>BookingID</h2>
            <asp:TextBox ID="TextBox1" Text="0" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>

            <h2>No. of Adults</h2>
					<div class="dropdown-button">  
                        <asp:DropDownList ID="DropDownList1" class="dropdown" runat="server" Width="50%" Height="35px" border="solid" tabindex="10" data-settings='{"wrapperClass":"flat"}'>
                        <asp:ListItem Value="0">a</asp:ListItem>
                        <asp:ListItem Value="1">d</asp:ListItem>
                        <asp:ListItem Value="2">c</asp:ListItem>
                        <asp:ListItem Value="3">d</asp:ListItem>
                        <asp:ListItem Value="4">e</asp:ListItem>
                        <asp:ListItem Value="5">f</asp:ListItem>
                        </asp:DropDownList>
					</div>

  
            <h2>No. of Children</h2>
					<div class="dropdown-button">  
					
					 <asp:DropDownList ID="DropDownList2" class="dropdown" runat="server" Width="50%" Height="35px" border="solid" tabindex="10" data-settings='{"wrapperClass":"flat"}'>
                        <asp:ListItem Value="">0</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        </asp:DropDownList>
					</div>

            <h2>Check In</h2>
					<div class="dropdown-button">  
                       
                        <asp:TextBox ID="TextCheckIn" TextMode="Date" runat="server"></asp:TextBox>   			
				    
					</div>

            <h2>Check Out</h2>
					<div class="dropdown-button">  
					
					  
					  
                        <asp:TextBox ID="TextCheckOut" TextMode="Date" runat="server"></asp:TextBox>   	     			

					</div>

                       <h2>Room Name</h2>
              <asp:DropDownList ID="DropDownList3" class="dropdown" runat="server"  Width="50%" Height="35px" border="solid" tabindex="10" data-settings='{"wrapperClass":"flat"}'>
                        
                        <asp:ListItem Value="single room">Single Room</asp:ListItem>
                        <asp:ListItem Value="2">Premium Single Room</asp:ListItem>
                        <asp:ListItem Value="2">Double Room</</asp:ListItem>
                        <asp:ListItem Value="2">Premium Double Room</asp:ListItem>
                        <asp:ListItem Value="3">Deluxe Suite</asp:ListItem>
                        <asp:ListItem Value="4">Executive Suite</asp:ListItem>
                        <asp:ListItem Value="4">Ocean View Suite</asp:ListItem>
                        <asp:ListItem Value="4">Presidential Suite</asp:ListItem>
                        <asp:ListItem Value="3">The Penthouse</asp:ListItem>
                        </asp:DropDownList>   

           <h2>Rate</h2>  
             <asp:TextBox ID="TextBox4" runat="server" Width="310px"></asp:TextBox><br />


        </div>

         <div style="width:32%; float:left; margin-left:10px">

             <h1>Guest Info</h1>
             

                          <h2>Full Name</h2>  
              <asp:TextBox ID="TextBox2" runat="server" Width="312px"></asp:TextBox>

              <h2>Phone number</h2>  
             <asp:TextBox ID="TextBox3" TextMode="Number" runat="server" Width="310px"></asp:TextBox><br />


             <asp:Button ID="Button1" BackColor="blue"   runat="server" Text="Book and Proceed " OnClick="Button1_Click" />

         </div>
        
    </div>
    </form>
</body>
</html>
