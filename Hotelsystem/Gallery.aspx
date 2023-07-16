<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Hotelsystem.Gallery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
   <style>
  .imageeffect:hover
        {
            
            width: 450px;
            height:350px;
            -moz-box-shadow: 0 0 30px red;
            -webkit-box-shadow: 0 0 30px red;
            box-shadow: 0 0 30px red;
            transform: scale(1);
            transition: .3s ease;
        }
       .imageeffect {
           height: 197px;
           width: 399px;
       }

     

    </style>

      <title>Hotel Management System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery.jcarousel.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/MyriadPro.font.js"></script>
<script type="text/javascript" src="js/ArialBold.font.js"></script>
<script type="text/javascript" src="js/jquery-func.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" />


  

</head>

<body>

    <form id="form1" runat="server">
    
          <div id="header">
  <div class="shell">
  
    <div id="navigation">
      <ul>
        <li><a style="font-size:20px" href="home2.aspx">HOME</a></li>
        <li><a style="font-size:20px" href="#">ABOUT</a></li>
        <li><a style="font-size:20px" href="Gallery.aspx">GALLERY</a></li>
        <li><a style="font-size:20px" href="Login.aspx">RESERVATION</a></li>
        <li><a style="font-size:20px" href="#">CONTACT</a></li>
        <li><a style="font-size:20px" href="HotelMgtLogin.aspx">SIGN IN</a></li>
      </ul>
    </div>
  </div>
        </div>     

        <div>

       <div  style="height:200px">

           <div style="width:32%; height:200px;float:left;margin-left:10px">

               <img src="images/th (1).jpg" class="imageeffect" />

           </div>
           <div style="width:32%; height:200px; float:left;margin-left:10px">
                <img src="images/th (2).jpg" class="imageeffect" />
           </div>
           <div style="width:32%; height:200px; float:left;margin-left:10px">
               <img src="images/hotel1.jpg" class="imageeffect"  />
           </div>

       </div>

          <div  style="height:200px;margin-top:20px">

           <div style="width:32%; height:200px; float:left; margin-left:10px">
                <img src="images/bg.jpg" class="imageeffect"  />
           </div>
           <div style="width:32%; height:200px; float:left; margin-left:10px">
               <img src="images/istockphoto-1333257950-1024x1024.jpg" class="imageeffect"  />
           </div>
           <div style="width:32%; height:200px; float:left;margin-left:10px">
                <img src="images/th (1).jpg" class="imageeffect" />
           </div>

       </div>
        
          <div style="height:200px; margin-top:20px">

           <div style="width:32%; height:200px; float:left; background-color:red;margin-left:10px"></div>
           <div style="width:32%; height:200px; float:left; background-color:green; margin-left:10px"></div>
           <div style="width:32%; height:200px; float:left; background-color:pink;margin-left:10px"></div>

       </div>
</div>

    </form>
</body>
</html>
