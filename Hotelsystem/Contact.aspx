<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Hotelsystem.Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
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
<body style="background-color:white">
    <form id="form1" runat="server">
   
              <div id="header">
  <div class="shell">
  
    <div id="navigation">
      <ul>
        <li><a href="#" class="active">HOME</a></li>
        <li><a href="#">ABOUT</a></li>
        <li><a href="#">GALLERY</a></li>
        <li><a href="#">RESERVATION</a></li>
        <li><a href="#">CONTACT</a></li>
        <li><a href="#">SIGN IN</a></li>
      </ul>
    </div>
  </div>
</div>

         <div style="margin-left:50px; margin-right:50px">

            <img src ="images/eko-slide4.jpg" height="300px" width="100%"/>

        </div>

        <div>
                <h1 style="text-align:center; color:black">Get in touch with us</h1>
        </div>

         <div>
            <div style="width:50%; float:left; font-size:18px;margin-left:50px"> 
             
                 <!-- Email -->
                <div class="form-group" >
                  
                  <input class="form-control" id="email" placeholder="Enter your email address" style="font-size:12px; margin-top:15px;height:40px; border:solid; width:500px" required>
                  <span class="help-block"></span>
                </div>

                <!-- Name -->
                <div class="form-group">
                  
                  <input type="text" name="name" class="form-control" id="name" placeholder="Enter your name"  style="font-size:12px; margin-top:15px; width:500px;height:40px; border:solid" required>
                  <span class="help-block"></span>
                </div>

                 <!-- Message -->
                <div class="form-group" ">
                
                  <textarea name="message" class="form-control" id="message" rows="6" placeholder="Enter your message" style="font-size:12px; margin-top:15px;  width:500px; height:100px; border:solid"  required></textarea>
                  <span class="help-block"></span></div>

                 <!-- Submit -->
                <button type="submit" class="btn btn-default" style="font-size:12px; margin-top:15px;height:40px; border:solid; width:500px" >
                  Send Message</button>
                
            </div>
          
            <div style="width:40%; float:left; margin-left:10px; font-size:18px">
                <h2>Information</h2>
                

         </div>

        </div>



    </form>
</body>
</html>
