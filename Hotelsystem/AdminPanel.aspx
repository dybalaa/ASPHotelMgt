<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="Hotelsystem.AdminPane_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

<style>
.tab {
  float: left;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: 20%;
}

/* Style the buttons that are used to open the tab content */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 1px solid #ccc;
  width: 75%;
  border-left: none;
  display: none;
}

</style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button4" runat="server" Text="logout" Width="120px" Height="46px" Font-Size="25px" BorderStyle="Solid" OnClick="Button4_Click" /> <br />
    
        <div class="tab">
  <button style="font-size:30px" class="tablinks" onmouseover="openCity(event, 'London')">Roles</button>
  <button style="font-size:30px" class="tablinks" onmouseover="openCity(event, 'Paris')">MgtUsers</button>
  <button style="font-size:30px" class="tablinks" onmouseover="openCity(event, 'Tokyo')">Rooms</button>
</div>

<div id="London" class="tabcontent">
 
     <h2>Role</h2>
         
        <asp:Label ID="Label1" runat="server" Text="Role ID"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

        <asp:Label ID="Label2" runat="server" Text="Role Name"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

        <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" /><br />

    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView><br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True;" SelectCommand="SELECT * FROM MgtRoles">  </asp:SqlDataSource><br />



</div>

<div id="Paris" class="tabcontent">
 
    <h2>UserMgtRegistration </h2>
            
        <asp:Label ID="Label3" runat="server" Text="Email Address"></asp:Label>
        <asp:TextBox ID="TextBox3" TextMode="Email" runat="server"></asp:TextBox>

        <asp:Label ID="Label4" runat="server" Text="Role ID"></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>

         <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>


        <asp:Button ID="Button2" runat="server" Text="Save" OnClick="Button2_Click" /><br />
     <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2"></asp:GridView><br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True;" SelectCommand="SELECT * FROM UserMgtRegistration">  </asp:SqlDataSource><br />


</div>

<div id="Tokyo" class="tabcontent">
  <h3>Rooms</h3>
 
     <asp:Label ID="Label6" runat="server" Text="RoomID"></asp:Label>
        <asp:TextBox ID="TextBox6" TextMode="Email" runat="server"></asp:TextBox>

        <asp:Label ID="Label7" runat="server" Text="Room"></asp:Label>
        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>

         <asp:Label ID="Label8" runat="server" Text="Rate"></asp:Label>
        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>

       <asp:Button ID="Button3" runat="server" Text="Save" OnClick="Button3_Click" /><br />

       <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource3"></asp:GridView><br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True;" SelectCommand="SELECT * FROM Rooms">  </asp:SqlDataSource><br />




</div>

        <div class="clearfix"></div>

<script>
    function openCity(evt, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
    }
</script>

    </form>
</body>
</html>
