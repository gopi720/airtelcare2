<!DOCTYPE html>
<%@page isELIgnored="false"%>
<html>
  <head>
    <title>New DTH Connection Request</title>
    <style>
	    body {
               font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
            }
            p {
              border: 1px solid black;
            }
    </style>
  </head>            
  <body>
  	<h2>New Connection Request Information</h2>
  	<p>
  	  Hi <%= request.getAttribute("name")%><br>
  	  Thank you for your interest on gopi DTH Services, we have received your new connection request for ${connectionType}. Our team will reach to you within 24-48 hours. Your reference No: ${refNo}	
  	</p>
  	
  </body>
</html>
