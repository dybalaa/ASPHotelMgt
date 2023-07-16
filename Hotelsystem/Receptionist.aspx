<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receptionist.aspx.cs" Inherits="Hotelsystem.Receptionist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
    .collapsible {
    border-style: none;
        border-color: inherit;
        border-width: medium;
        background-color: #777;
        color: white;
        cursor: pointer;
        padding:18px;
        width: 225px;
        text-align: center;
        outline: none;
        font-size: 22px;
  
}

.active, .collapsible:hover {
  background-color: #555;
}

.content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
  background-color: #f1f1f1;
}

</style>

</head>
<body>
    <form id="form1" runat="server">

        <asp:Button ID="Button2" runat="server" Text="Log out" OnClick="Button2_Click" />

    <div>
        <h2>Reservations</h2>
    
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True;"  SelectCommand="SELECT * FROM Reservations"></asp:SqlDataSource><br />

        <h2>Attendants</h2>

        <button type="button" class="collapsible">&nbsp;Assign Attendant</button>
        <div class="content">
          
            <asp:Label ID="Label" runat="server" Font-Size="20px" Text="BookingReference"></asp:Label><br />
        <asp:DropDownList ID="DropDownList1" runat="server" BorderStyle="Solid" AutoPostBack="true" Width="314px" Height="36px">
           <asp:ListItem Text="---Select Booking---"></asp:ListItem>
        </asp:DropDownList><br/>
            
            <asp:Label ID="Label2" runat="server" Font-Size="20px" Text="Attendant"></asp:Label><br />
        <asp:DropDownList ID="DropDownList2" runat="server" BorderStyle="Solid" AutoPostBack="true" Width="314px" Height="36px">
           <asp:ListItem Text="---Attendants---"></asp:ListItem>
        </asp:DropDownList><br/>
            
                        <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click"  border="solid" Width="162px" Height="46px" Font-Size="22px"/> <br /> <br />


        </div>

    </div>
         <div style="margin-top:15px">

             <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
                 <AlternatingRowStyle BackColor="White" />
                 <EditRowStyle BackColor="#7C6F57" />
                 <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#E3EAEB" />
                 <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                 <SortedAscendingCellStyle BackColor="#F8FAFA" />
                 <SortedAscendingHeaderStyle BackColor="#246B61" />
                 <SortedDescendingCellStyle BackColor="#D4DFE1" />
                 <SortedDescendingHeaderStyle BackColor="#15524A" />
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True;" SelectCommand="SELECT * FROM Attendants">  </asp:SqlDataSource>
             </div>


          <script>
              var coll = document.getElementsByClassName("collapsible");
              var i;

              for (i = 0; i < coll.length; i++) {
                  coll[i].addEventListener("click", function () {
                      this.classList.toggle("active");
                      var content = this.nextElementSibling;
                      if (content.style.display === "block") {
                          content.style.display = "none";
                      } else {
                          content.style.display = "block";
                      }
                  });
              }
</script>
      
    </form>
</body>
</html>
