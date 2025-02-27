<%@page import="com.pharmacystore.pojo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.daoimpl.ProductDaoImpl"%>
<%@page import="com.pharmacystore.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>	
<%
   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
   response.setHeader("Pragma", "no-cache"); // HTTP 1.0
   response.setHeader("Expires", "0"); // Proxies
   %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <!-- Favicons -->
      <link rel="icon" type="image/png" href="Homepage/assets/img/favicon.png">
      <!-- alert -->
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>    
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <title>View All Product</title>
   </head>
   <style>
      body {
      font-family: Arial, Helvetica, sans-serif;
      }
      /* The Modal (background) */
      .modal {
      display: none; /* Hidden by default */
      position: fixed; /* Stay in place */
      z-index: 1; /* Sit on top */
      padding-top: 100px; /* Location of the box */
      left: 0;
      top: 0;
      width: 100%; /* Full width */
      height: 100%; /* Full height */
      overflow: auto; /* Enable scroll if needed */
      background-color: rgb(0, 0, 0); /* Fallback color */
      background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
      }
      /* Modal Content */
      .modal-content {
      background-color: #fefefe;
      margin: auto;
      padding: 20px;
      border: 1px solid #888;
      width: 30%;
      }
      /* The Close Button */
      .close {
      color: #aaaaaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
      }
      .close:hover, .close:focus {
      color: #000;
      text-decoration: none;
      cursor: pointer;
      }
      #nav{
      background-color:#1977cc;
      color:white;
      }
      #myBtn:hover{
      background-color:#1997cc;
      }
      #myBtn2:hover{
      background-color:#1997cc;
      }
   </style>
   <body>
      <%
         if(!session.isNew() || session.getAttribute("ADMIN") != null)
         {
         %>
      <nav class="navbar navbar-default">
         <div class="container-fluid" id="nav">
            <div class="navbar-header">
               <a href="adminhome.jsp" class="navbar-brand" id="nav">Pharma<span class="text-warning">Care</span> </a>
            </div>
            <ul class="nav navbar-nav navbar-right">
               <li><a href="logoutadmin.jsp"id="nav"><span class="glyphicon glyphicon-log-out" id="nav"></span> Logout</a></li>
            </ul>
         </div>
      </nav>
      <div class="container">
         <c:if test="${param.msg == 'delProSuccess'}">
            <c:set var="message" value="Product Deleted Successfully !!!"/>
         </c:if>
         <c:if test="${param.msg == 'delProFail'}">
            <c:set var="message" value="Product Deleted Failed !!!"/>
         </c:if>
         <c:if test="${not empty message}">
            <script>
               if ("${message}" !== "") {
                 $(document).ready(function() {
                   if ("${message.trim()}" === "Product Deleted Successfully !!!") {
                     swal({
                       title: 'Success!',
                       text: '${message.trim()}',
                       icon: 'success'
                     });
                   } else {
                     swal({
                       title: 'Message From Server',
                       text: '${message.trim()}',
                       icon: 'error'
                     });
                   }
                 });
               }
            </script>
         </c:if>
         <div class="table-wrapper">
            <div class="table-title">
               <div class="row">
                  <div class="col-sm-6">
                     <h2> Products For You</h2>
                     <br>
                  </div>
               </div>
            </div>
            <table class="table table-striped table-hover table-bordered">
               <thead>
                  <tr>
                     <th>Product ID</th>
                     <th> Product Name</th>
                     <th>Category id</th>
                     <th>Quantity</th>
                     <th> Price</th>
                     <th>Description</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach items="${applicationScope.PROLIST}" var="p">
                     <tr>
                        <td>${p.productid}</td>
                        <td>${p.productname}</td>
                        <td>${p.categoryid}</td>
                        <td>${p.price}</td>
                        <td>${p.quantity}</td>
                        <td>${p.description}</td>
                        <td>
                           <form action="DeleteProduct" method="post">
                              <input type="hidden" name="productid" value="${p.productid}"/>
                              <input class = "btn btn-danger" id="myBtn2" type="submit" value="Delete This Product"/>
                           </form>
                        </td>
                        <td>
                           <button id="myBtn" class="btn btn-danger"
                              onclick="openMyDialog(${p.productid})">Update This Product</button>		                        	
                        </td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
      </div>
      <div class="clearfix">
         <ul class="pagination">
            <li class="page-item disabled"><a href="#">Previous</a></li>
            <li class="page-item active"><a href="#" class="page-link">1</a></li>
            <li class="page-item"><a href="#" class="page-link">2</a></li>
            <li class="page-item "><a href="#" class="page-link">3</a></li>
            <li class="page-item"><a href="#" class="page-link">4</a></li>
            <li class="page-item"><a href="#" class="page-link">Next</a></li>
         </ul>
      </div>
      <!-- Start Of The Modal Design-->
      <div class="container" align="center">
         <div id="myModal" class="modal">
            <input type="hidden" id="productId" value="" />
            <!-- Modal content -->
            <div class="modal-content">
               <span class="close">&times;</span>
               <table class="table table-hover">
                  <tr>
                     <th align="center"> <b>Enter Product Details To Be Updated : </b></th>
                  </tr>
                  <tr>
                     <td>
                        <label class="control-label" for="pname">Enter New Name</label> 
                        <input type="text" class="form-control" id="pname" name="pname" placeholder="${p.productname}"/>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <label class="control-label" for="price">Enter New Price</label> 
                        <input type="text" class="form-control" id="price" name="price" placeholder="${p.price}"/>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <label class="control-label" for="quantity">Enter New Quantity</label> 
                        <input type="text" class="form-control" id="quantity" name="quantity" placeholder="${p.quantity}"/>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <label class="control-label" for="pdesc">Enter New Description</label> 
                        <input type="text" class="form-control" id="pdesc" name="pdesc" placeholder="${p.description}"/>
                     </td>
                  </tr>
                  <tr>
                     <td><button id="btnUpdate" class="btn btn-danger" onclick="updateProduct()">
                        Update Product
                        </button>
                     </td>
                  </tr>
               </table>
            </div>
         </div>
      </div>
      <!-- End Of The Modal Design-->
      <script>
         // Get the modal
         var modal = document.getElementById("myModal");
         
         // Get the button that posts complaint
         var btnRaise = document.getElementById("btnRaise");
         
         // Get the <span> element that closes the modal
         var span = document.getElementsByClassName("close")[0];
         var productid = 0;
         
         // When the user clicks the button, open the modal 
         function openMyDialog(id) {
         	modal.style.display = "block";
         	productid = id;
         }
         
         function updateProduct() {
         
         	var price = document.getElementById("price").value;										
         	var qty = document.getElementById("quantity").value;	
         	var pname = document.getElementById("pname").value;										
         	var pdesc = document.getElementById("pdesc").value;
         							
         	var url = "UpdateProduct?"
         				+ "productid="+ productid
         				+ "&price="+ price
         				+ "&quantity="+ qty
         				+ "&productname="+ pname
         				+ "&description="+ pdesc;
         
         	modal.style.display = "none";
         
         	if (window.XMLHttpRequest) {
         		request = new XMLHttpRequest();
         	} else if (window.ActiveXObject) {
         		request = new ActiveXObject("Microsoft.XMLHTTP");
         	}
         
         	try {
         		request.onreadystatechange = getProductResponse;
         		request.open("GET", url, true);
         		request.send();
         	} catch (e) {
         		alert("Unable to connect to server");
         	}
         }
         
         function getProductResponse() {
         	if (request.readyState == 4) {
         		var val = request.responseText;
         		if (val.trim() == "success") {
         			alert("product updated");
         			window.location.reload(true);
         		} else {
         			alert("product update failed");
         		}
         	}
         }
         
         // When the user clicks on <span> (x), close the modal
         span.onclick = function() {
         	modal.style.display = "none";
         	alert(productid);
         }
         
         // When the user clicks anywhere outside of the modal, close it
         window.onclick = function(event) {
         	if (event.target == modal) {
         		modal.style.display = "none";
         	}
         }
      </script>
      <%				
         }
         else{
         %>
      <p style=color:red> You need to login first !!! </p>
      <jsp:include page="adminlogin.jsp"></jsp:include>
      <%				
         }
         %>
   </body>
</html>