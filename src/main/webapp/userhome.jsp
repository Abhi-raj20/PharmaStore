<%@page import="com.pharmacystore.pojo.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.daoimpl.CategoryDaoImpl"%>
<%@page import="com.pharmacystore.dao.CategoryDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
   response.setHeader("Pragma", "no-cache"); // HTTP 1.0
   response.setDateHeader("Expires", 0);
   %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>User Home</title>
      <meta content="" name="description">
      <meta content="" name="keywords">
      <!-- Favicons -->
      <link rel="icon" type="image/png" href="Homepage/assets/img/favicon.png">
      <!-- Google Fonts -->
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
      <!-- Vendor CSS Files -->
      <link href="Homepage/vendor/animate.css/animate.min.css" rel="stylesheet">
      <link href="Homepage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <link href="Homepage/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
      <link href="Homepage/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
      <link href="Homepage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
      <link href="Homepage/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
      <link href="Homepage/vendor/remixicon/remixicon.css" rel="stylesheet">
      <link href="Homepage/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
      <!-- Template Main CSS File -->
      <link href="Homepage/css/style.css" rel="stylesheet">
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>    
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   </head>
   <style>
      #uname{
      color:#1997cc;
      }
   </style>
   <body>
      <%
         if(!session.isNew() || session.getAttribute("USER") != null)
         {
         %>	
      <!-- ======= Top Bar ======= -->
      <div id="topbar" class="d-flex align-items-center fixed-top">
         <div class="container d-flex justify-content-between">
            <div class="contact-info d-flex align-items-center">
               <i class="bi bi-envelope"></i> <a href="mailto:contact@example.com">abhi@gmail.com</a>
               <i class="bi bi-phone"></i> +91 9109964555
            </div>
            <div class="d-none d-lg-flex social-links align-items-center">
               <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
               <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
               <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
               <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
            </div>
         </div>
      </div>
      <!-- ======= Header ======= -->
      <header id="header" class="fixed-top">
         <div class="container d-flex align-items-center">
            <h1 class="logo me-auto" id="uname"><a href="index.html" >Pharma<span class="text-warning">Care</span></a></h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
            <nav id="navbar" class="navbar order-last order-lg-0">
               <ul>
                  <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
                  <li><a class="nav-link scrollto" href="#about">About</a></li>
                  <li><a class="nav-link scrollto" href="#services">Services</a></li>
                  <li><a class="nav-link scrollto" href="#departments">Departments</a></li>
                  <li><a class="nav-link scrollto" href="#doctors">Doctors</a></li>
                  <li class="dropdown">
                     <a href="#"><span>Products</span> <i class="bi bi-chevron-down"></i></a>
                     <ul>
                        <select class="form-control" id="categoryid" name="categoryid">
                           <%
                              CategoryDao daoImpl = new CategoryDaoImpl();
                                       			List<Category> lst = daoImpl.getAllCategories();
                                       			if(lst.size() > 0)
                                       			{
                                       				for(Category category : lst)
                                       				{
                                       		%>
                           <option value="<%=category.getCategoryId()%>"> <%=category.getCategoryName()%></option>
                           <%			
                              }
                              }
                              %>
                        </select>
                        <c:url var="categoryPageUrl" value="displayproductcategorywisecontroller">
                           <c:param name="page" value="1" />
                           <c:param name="categoryid" value="${selectedCategoryId}" />
                        </c:url>
                        <script>
                           window.onload = function() {
                               var selectElement = document.getElementById("categoryid");
                               selectElement.onchange = function() {
                                   var selectedCategoryId = this.value;
                           var url = "${categoryPageUrl}"+selectedCategoryId;
                                   window.location.href = url;
                               };
                           };
                        </script>
                     </ul>
                  </li>
                  <li class="dropdown">
                     <a href="#"><span>Profile</span> <i class="bi bi-chevron-down"></i></a>
                     <ul>
                        <li><a href="viewyourordercontroller">View Orders</a></li>
                        <li><a href="updateaddresscontroller">Update Address</a></li>
                        <li><a href = "userlogout.jsp">LOGOUT</a></li>
                     </ul>
                  </li>
               </ul>
               </ul>
               </li>
               </ul>
               <i class="bi bi-list mobile-nav-toggle"></i>
            </nav>
            <!-- .navbar -->
            <a href="#appointment" class="appointment-btn scrollto"><span class="d-none d-md-inline">Make an</span> Appointment</a>
         </div>
      </header>
      <!-- End Header -->
      <!-- ======= Hero Section ======= -->
      <section id="hero" class="d-flex align-items-center">
         <div class="container">
            <c:if test="${param.msg == 'confirmSuccess'}">
               <c:set var="message" value="Order confirmed successful !!!"/>
            </c:if>
            <c:if test="${param.msg == 'MsgSendSucces'}">
               <c:set var="message" value="Message Send successful !!!"/>
            </c:if>
            <c:if test="${param.msg == 'MsgSendFail'}">
               <c:set var="message" value="Message Send Failed !!!"/>
            </c:if>
            
            <c:if test="${not empty message}">
            <script>
               if ("${message}" !== "") {
                 $(document).ready(function() {
                   if ("${message.trim()}" === "Message Send Failed !!!") {
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
            <h1>Welcome to Pharma<span class="text-warning">Care</span></h1>
            <h2>Your trusted online pharmacy destination!
               <br>
               Discover a comprehensive range of pharmaceutical products, health supplements, 
               and wellness essentials, all tailored to meet your healthcare needs.  
               Start your journey to better health today!
            </h2>
            <a href="#about" class="btn-get-started scrollto">Get Started</a>
         </div>
      </section>
      <!-- End Hero -->
      <main id="main">
         <!-- ======= Why Us Section ======= -->
         <section id="why-us" class="why-us">
            <div class="container">
               <div class="row">
                  <div class="col-lg-4 d-flex align-items-stretch">
                     <div class="content">
                        <h3>Why Choose Pharma<span class="text-warning">Care</span>?</h3>
                        <p>
                           Welcome to Pharma<span class="text-warning">Care</span>, your ultimate destination for all your pharmacy needs. 
                           Our online platform offers unmatched convenience, allowing you to access a 
                           wide selection of products from the comfort of your home. 
                           Say goodbye to long queues and tiresome trips to physical stores.
                        </p>
                        <div class="text-center">
                           <a href="#" class="more-btn">Learn More <i class="bx bx-chevron-right"></i></a>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-8 d-flex align-items-stretch">
                     <div class="icon-boxes d-flex flex-column justify-content-center">
                        <div class="row">
                           <div class="col-xl-4 d-flex align-items-stretch">
                              <div class="icon-box mt-4 mt-xl-0">
                                 <i class="bx bx-receipt"></i>
                                 <h4>Corporis voluptates sit</h4>
                                 <p>Consequuntur sunt aut quasi enim aliquam quae harum pariatur laboris nisi ut aliquip</p>
                              </div>
                           </div>
                           <div class="col-xl-4 d-flex align-items-stretch">
                              <div class="icon-box mt-4 mt-xl-0">
                                 <i class="bx bx-cube-alt"></i>
                                 <h4>Ullamco laboris ladore pan</h4>
                                 <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt</p>
                              </div>
                           </div>
                           <div class="col-xl-4 d-flex align-items-stretch">
                              <div class="icon-box mt-4 mt-xl-0">
                                 <i class="bx bx-images"></i>
                                 <h4>Labore consequatur</h4>
                                 <p>Aut suscipit aut cum nemo deleniti aut omnis. Doloribus ut maiores omnis facere</p>
                              </div>
                           </div>
                        </div>
                     </div>
                     <!-- End .content-->
                  </div>
               </div>
            </div>
         </section>
         <!-- End Why Us Section -->
         <!-- ======= About Section ======= -->
         <section id="about" class="about">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-xl-5 col-lg-6 video-box d-flex justify-content-center align-items-stretch position-relative">
                     <a href="https://www.youtube.com/watch?v=jDDaplaOz7Q" class="glightbox play-btn mb-4"></a>
                  </div>
                  <div class="col-xl-7 col-lg-6 icon-boxes d-flex flex-column align-items-stretch justify-content-center py-5 px-lg-5">
                     <h3>Discover the Vision Behind Pharma<span class="text-warning">Care</span>: Empowering Your Health and Wellness Journey</h3>
                     <p>Esse voluptas cumque vel exercitationem. Reiciendis est hic accusamus. Non ipsam et sed minima temporibus laudantium. Soluta voluptate sed facere corporis dolores excepturi. Libero laboriosam sint et id nulla tenetur. Suscipit aut voluptate.</p>
                     <div class="icon-box">
                        <div class="icon"><i class="bx bx-fingerprint"></i></div>
                        <h4 class="title"><a href="">Lorem Ipsum</a></h4>
                        <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
                     </div>
                     <div class="icon-box">
                        <div class="icon"><i class="bx bx-gift"></i></div>
                        <h4 class="title"><a href="">Nemo Enim</a></h4>
                        <p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
                     </div>
                     <div class="icon-box">
                        <div class="icon"><i class="bx bx-atom"></i></div>
                        <h4 class="title"><a href="">Dine Pad</a></h4>
                        <p class="description">Explicabo est voluptatum asperiores consequatur magnam. Et veritatis odit. Sunt aut deserunt minus aut eligendi omnis</p>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- End About Section -->
         <!-- ======= Counts Section ======= -->
         <section id="counts" class="counts">
            <div class="container">
               <div class="row">
                  <div class="col-lg-3 col-md-6">
                     <div class="count-box">
                        <i class="fas fa-user-md"></i>
                        <span data-purecounter-start="0" data-purecounter-end="85" data-purecounter-duration="1" class="purecounter"></span>
                        <p>Doctors</p>
                     </div>
                  </div>
                  <div class="col-lg-3 col-md-6 mt-5 mt-md-0">
                     <div class="count-box">
                        <i class="far fa-hospital"></i>
                        <span data-purecounter-start="0" data-purecounter-end="18" data-purecounter-duration="1" class="purecounter"></span>
                        <p>Departments</p>
                     </div>
                  </div>
                  <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                     <div class="count-box">
                        <i class="fas fa-flask"></i>
                        <span data-purecounter-start="0" data-purecounter-end="12" data-purecounter-duration="1" class="purecounter"></span>
                        <p>Research Labs</p>
                     </div>
                  </div>
                  <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                     <div class="count-box">
                        <i class="fas fa-award"></i>
                        <span data-purecounter-start="0" data-purecounter-end="150" data-purecounter-duration="1" class="purecounter"></span>
                        <p>Awards</p>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- End Counts Section -->
         <!-- ======= Services Section ======= -->
         <section id="services" class="services">
            <div class="container">
               <div class="section-title">
                  <h2>Services</h2>
                  <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
               </div>
               <div class="row">
                  <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                     <div class="icon-box">
                        <div class="icon"><i class="fas fa-heartbeat"></i></div>
                        <h4><a href="">Lorem Ipsum</a></h4>
                        <p>Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi</p>
                     </div>
                  </div>
                  <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
                     <div class="icon-box">
                        <div class="icon"><i class="fas fa-pills"></i></div>
                        <h4><a href="">Sed ut perspiciatis</a></h4>
                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</p>
                     </div>
                  </div>
                  <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
                     <div class="icon-box">
                        <div class="icon"><i class="fas fa-hospital-user"></i></div>
                        <h4><a href="">Magni Dolores</a></h4>
                        <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia</p>
                     </div>
                  </div>
                  <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
                     <div class="icon-box">
                        <div class="icon"><i class="fas fa-dna"></i></div>
                        <h4><a href="">Nemo Enim</a></h4>
                        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis</p>
                     </div>
                  </div>
                  <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
                     <div class="icon-box">
                        <div class="icon"><i class="fas fa-wheelchair"></i></div>
                        <h4><a href="">Dele cardo</a></h4>
                        <p>Quis consequatur saepe eligendi voluptatem consequatur dolor consequuntur</p>
                     </div>
                  </div>
                  <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
                     <div class="icon-box">
                        <div class="icon"><i class="fas fa-notes-medical"></i></div>
                        <h4><a href="">Divera don</a></h4>
                        <p>Modi nostrum vel laborum. Porro fugit error sit minus sapiente sit aspernatur</p>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- End Services Section -->
         <!-- ======= Appointment Section ======= -->
         <section id="appointment" class="appointment section-bg">
            <div class="container">
               <div class="section-title">
                  <h2>Make an Appointment</h2>
                  <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
               </div>
               <form action="forms/appointment.php" method="post" role="form" class="php-email-form">
                  <div class="row">
                     <div class="col-md-4 form-group">
                        <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                        <div class="validate"></div>
                     </div>
                     <div class="col-md-4 form-group mt-3 mt-md-0">
                        <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email">
                        <div class="validate"></div>
                     </div>
                     <div class="col-md-4 form-group mt-3 mt-md-0">
                        <input type="tel" class="form-control" name="phone" id="phone" placeholder="Your Phone" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                        <div class="validate"></div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4 form-group mt-3">
                        <input type="datetime" name="date" class="form-control datepicker" id="date" placeholder="Appointment Date" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                        <div class="validate"></div>
                     </div>
                     <div class="col-md-4 form-group mt-3">
                        <select name="department" id="department" class="form-select">
                           <option value="">Select Department</option>
                           <option value="Department 1">Department 1</option>
                           <option value="Department 2">Department 2</option>
                           <option value="Department 3">Department 3</option>
                        </select>
                        <div class="validate"></div>
                     </div>
                     <div class="col-md-4 form-group mt-3">
                        <select name="doctor" id="doctor" class="form-select">
                           <option value="">Select Doctor</option>
                           <option value="Doctor 1">Doctor 1</option>
                           <option value="Doctor 2">Doctor 2</option>
                           <option value="Doctor 3">Doctor 3</option>
                        </select>
                        <div class="validate"></div>
                     </div>
                  </div>
                  <div class="form-group mt-3">
                     <textarea class="form-control" name="message" rows="5" placeholder="Message (Optional)"></textarea>
                     <div class="validate"></div>
                  </div>
                  <div class="mb-3">
                     <div class="loading">Loading</div>
                     <div class="error-message"></div>
                     <div class="sent-message">Your appointment request has been sent successfully. Thank you!</div>
                  </div>
                  <div class="text-center"><button type="submit">Make an Appointment</button></div>
               </form>
            </div>
         </section>
         <!-- End Appointment Section -->
         <!-- ======= Departments Section ======= -->
         <section id="departments" class="departments">
            <div class="container">
               <div class="section-title">
                  <h2>Departments</h2>
                  <p>Here, you can explore our diverse range of departments, each dedicated to specific healthcare needs. Whether you're looking for medications, personal care products, vitamins and supplements, or specialized health solutions, our departments offer a curated selection of high-quality products. </p>
               </div>
               <div class="row">
                  <div class="col-lg-3">
                     <ul class="nav nav-tabs flex-column">
                        <li class="nav-item">
                           <a class="nav-link active show" data-bs-toggle="tab" href="#tab-1">Cardiology</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" data-bs-toggle="tab" href="#tab-2">Neurology</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" data-bs-toggle="tab" href="#tab-3">Hepatology</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" data-bs-toggle="tab" href="#tab-4">Pediatrics</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" data-bs-toggle="tab" href="#tab-5">Eye Care</a>
                        </li>
                     </ul>
                  </div>
                  <div class="col-lg-9 mt-4 mt-lg-0">
                     <div class="tab-content">
                        <div class="tab-pane active show" id="tab-1">
                           <div class="row">
                              <div class="col-lg-8 details order-2 order-lg-1">
                                 <h3>Cardiology</h3>
                                 <p class="fst-italic">Cardiology is a branch of medicine that deals with disorders of the heart and the cardiovascular system. </p>
                                 <p>The field includes medical diagnosis and treatment of congenital heart defects, coronary artery disease, heart failure, valvular heart disease, and electrophysiology.</p>
                              </div>
                              <div class="col-lg-4 text-center order-1 order-lg-2">
                                 <img src="Homepage/img/departments-1.jpg" alt="" class="img-fluid">
                              </div>
                           </div>
                        </div>
                        <div class="tab-pane" id="tab-2">
                           <div class="row">
                              <div class="col-lg-8 details order-2 order-lg-1">
                                 <h3>Neurology</h3>
                                 <p class="fst-italic">Neurological practice relies heavily on the field of neuroscience, the scientific study of the nervous system.</p>
                                 <p>It is the branch of medicine dealing with the diagnosis and treatment of all categories of conditions and disease involving the nervous system, which comprises the brain, the spinal cord and the peripheral nerves.</p>
                              </div>
                              <div class="col-lg-4 text-center order-1 order-lg-2">
                                 <img src="Homepage/img/departments-2.jpg" alt="" class="img-fluid">
                              </div>
                           </div>
                        </div>
                        <div class="tab-pane" id="tab-3">
                           <div class="row">
                              <div class="col-lg-8 details order-2 order-lg-1">
                                 <h3>Oncology</h3>
                                 <p class="fst-italic">Oncology is a branch of medicine that deals with the study, treatment, diagnosis and prevention of tumors</p>
                                 <p>Medical histories remain an important screening tool: the character of the complaints and nonspecific symptoms (such as fatigue, weight loss, unexplained anemia, fever of unknown origin, paraneoplastic phenomena and other signs) may warrant further investigation for malignancy. </p>
                              </div>
                              <div class="col-lg-4 text-center order-1 order-lg-2">
                                 <img src="Homepage/img/departments-3.jpg" alt="" class="img-fluid">
                              </div>
                           </div>
                        </div>
                        <div class="tab-pane" id="tab-4">
                           <div class="row">
                              <div class="col-lg-8 details order-2 order-lg-1">
                                 <h3>Dermatology</h3>
                                 <p class="fst-italic">Dermatology is the branch of medicine dealing with the skin</p>
                                 <p>It is a speciality with both medical and surgical aspects. A dermatologist is a specialist medical doctor who manages diseases related to skin, hair, nails, and some cosmetic problems.</p>
                              </div>
                              <div class="col-lg-4 text-center order-1 order-lg-2">
                                 <img src="Homepage/img/departments-4.jpg" alt="" class="img-fluid">
                              </div>
                           </div>
                        </div>
                        <div class="tab-pane" id="tab-5">
                           <div class="row">
                              <div class="col-lg-8 details order-2 order-lg-1">
                                 <h3>Surgical Gastroenterology</h3>
                                 <p class="fst-italic">Surgical Gastroenterology is a super speciality that deals with the diagnosis and treatment of disorders of the gastrointestinal tract.</p>
                                 <p>It is a branch of medicine that is constantly evolving, with new discoveries being made all the time. </p>
                              </div>
                              <div class="col-lg-4 text-center order-1 order-lg-2">
                                 <img src="Homepage/img/departments-5.jpg" alt="" class="img-fluid">
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- End Departments Section -->
         <!-- ======= Doctors Section ======= -->
         <section id="doctors" class="doctors">
            <div class="container">
               <div class="section-title">
                  <h2>Doctors</h2>
                  <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
               </div>
               <div class="row">
                  <div class="col-lg-6">
                     <div class="member d-flex align-items-start">
                        <div class="pic"><img src="Homepage/img/doctors/doctors-1.jpg" class="img-fluid" alt=""></div>
                        <div class="member-info">
                           <h4>Walter White</h4>
                           <span>Chief Medical Officer</span>
                           <p>Explicabo voluptatem mollitia et repellat qui dolorum quasi</p>
                           <div class="social">
                              <a href=""><i class="ri-twitter-fill"></i></a>
                              <a href=""><i class="ri-facebook-fill"></i></a>
                              <a href=""><i class="ri-instagram-fill"></i></a>
                              <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-6 mt-4 mt-lg-0">
                     <div class="member d-flex align-items-start">
                        <div class="pic"><img src="Homepage/img/doctors/doctors-2.jpg" class="img-fluid" alt=""></div>
                        <div class="member-info">
                           <h4>Sarah Jhonson</h4>
                           <span>Anesthesiologist</span>
                           <p>Aut maiores voluptates amet et quis praesentium qui senda para</p>
                           <div class="social">
                              <a href=""><i class="ri-twitter-fill"></i></a>
                              <a href=""><i class="ri-facebook-fill"></i></a>
                              <a href=""><i class="ri-instagram-fill"></i></a>
                              <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-6 mt-4">
                     <div class="member d-flex align-items-start">
                        <div class="pic"><img src="Homepage/img/doctors/doctors-3.jpg" class="img-fluid" alt=""></div>
                        <div class="member-info">
                           <h4>William Anderson</h4>
                           <span>Cardiology</span>
                           <p>Quisquam facilis cum velit laborum corrupti fuga rerum quia</p>
                           <div class="social">
                              <a href=""><i class="ri-twitter-fill"></i></a>
                              <a href=""><i class="ri-facebook-fill"></i></a>
                              <a href=""><i class="ri-instagram-fill"></i></a>
                              <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-6 mt-4">
                     <div class="member d-flex align-items-start">
                        <div class="pic"><img src="Homepage/img/doctors/doctors-4.jpg" class="img-fluid" alt=""></div>
                        <div class="member-info">
                           <h4>Amanda Jepson</h4>
                           <span>Neurosurgeon</span>
                           <p>Dolorum tempora officiis odit laborum officiis et et accusamus</p>
                           <div class="social">
                              <a href=""><i class="ri-twitter-fill"></i></a>
                              <a href=""><i class="ri-facebook-fill"></i></a>
                              <a href=""><i class="ri-instagram-fill"></i></a>
                              <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- End Doctors Section -->
         <!-- ======= Frequently Asked Questions Section ======= -->
         <section id="faq" class="faq section-bg">
            <div class="container">
               <div class="section-title">
                  <h2>Frequently Asked Questions</h2>
                  <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
               </div>
               <div class="faq-list">
                  <ul>
                     <li data-aos="fade-up">
                        <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" class="collapse" data-bs-target="#faq-list-1">Non consectetur a erat nam at lectus urna duis? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
                        <div id="faq-list-1" class="collapse show" data-bs-parent=".faq-list">
                           <p>
                              Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
                           </p>
                        </div>
                     </li>
                     <li data-aos="fade-up" data-aos-delay="100">
                        <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-2" class="collapsed">Feugiat scelerisque varius morbi enim nunc? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
                        <div id="faq-list-2" class="collapse" data-bs-parent=".faq-list">
                           <p>
                              Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
                           </p>
                        </div>
                     </li>
                     <li data-aos="fade-up" data-aos-delay="200">
                        <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-3" class="collapsed">Dolor sit amet consectetur adipiscing elit? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
                        <div id="faq-list-3" class="collapse" data-bs-parent=".faq-list">
                           <p>
                              Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis
                           </p>
                        </div>
                     </li>
                     <li data-aos="fade-up" data-aos-delay="300">
                        <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-4" class="collapsed">Tempus quam pellentesque nec nam aliquam sem et tortor consequat? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
                        <div id="faq-list-4" class="collapse" data-bs-parent=".faq-list">
                           <p>
                              Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in.
                           </p>
                        </div>
                     </li>
                     <li data-aos="fade-up" data-aos-delay="400">
                        <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-5" class="collapsed">Tortor vitae purus faucibus ornare. Varius vel pharetra vel turpis nunc eget lorem dolor? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
                        <div id="faq-list-5" class="collapse" data-bs-parent=".faq-list">
                           <p>
                              Laoreet sit amet cursus sit amet dictum sit amet justo. Mauris vitae ultricies leo integer malesuada nunc vel. Tincidunt eget nullam non nisi est sit amet. Turpis nunc eget lorem dolor sed. Ut venenatis tellus in metus vulputate eu scelerisque.
                           </p>
                        </div>
                     </li>
                  </ul>
               </div>
            </div>
         </section>
         <!-- End Frequently Asked Questions Section -->
         <!-- ======= Testimonials Section ======= -->
         <section id="testimonials" class="testimonials">
            <div class="container">
               <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
                  <div class="swiper-wrapper">
                     <div class="swiper-slide">
                        <div class="testimonial-wrap">
                           <div class="testimonial-item">
                              <img src="Homepage/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                              <h3>Saul Goodman</h3>
                              <h4>Ceo &amp; Founder</h4>
                              <p>
                                 <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                 Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.
                                 <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                              </p>
                           </div>
                        </div>
                     </div>
                     <!-- End testimonial item -->
                     <div class="swiper-slide">
                        <div class="testimonial-wrap">
                           <div class="testimonial-item">
                              <img src="Homepage/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                              <h3>Sara Wilsson</h3>
                              <h4>Designer</h4>
                              <p>
                                 <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                 Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
                                 <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                              </p>
                           </div>
                        </div>
                     </div>
                     <!-- End testimonial item -->
                     <div class="swiper-slide">
                        <div class="testimonial-wrap">
                           <div class="testimonial-item">
                              <img src="Homepage/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                              <h3>Jena Karlis</h3>
                              <h4>Store Owner</h4>
                              <p>
                                 <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                 Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.
                                 <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                              </p>
                           </div>
                        </div>
                     </div>
                     <!-- End testimonial item -->
                     <div class="swiper-slide">
                        <div class="testimonial-wrap">
                           <div class="testimonial-item">
                              <img src="Homepage/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                              <h3>Matt Brandon</h3>
                              <h4>Freelancer</h4>
                              <p>
                                 <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                 Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.
                                 <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                              </p>
                           </div>
                        </div>
                     </div>
                     <!-- End testimonial item -->
                     <div class="swiper-slide">
                        <div class="testimonial-wrap">
                           <div class="testimonial-item">
                              <img src="Homepage/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                              <h3>John Larson</h3>
                              <h4>Entrepreneur</h4>
                              <p>
                                 <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                 Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.
                                 <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                              </p>
                           </div>
                        </div>
                     </div>
                     <!-- End testimonial item -->
                  </div>
                  <div class="swiper-pagination"></div>
               </div>
            </div>
         </section>
         <!-- End Testimonials Section -->
         <!-- ======= Gallery Section ======= -->
         <section id="gallery" class="gallery">
            <div class="container">
               <div class="section-title">
                  <h2>Gallery</h2>
                  <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
               </div>
            </div>
            <div class="container-fluid">
               <div class="row no-gutters">
                  <div class="col-lg-3 col-md-4">
                     <div class="gallery-item">
                        <a href="Homepage/img/gallery/gallery-1.jpg" class="galelry-lightbox">
                        <img src="Homepage/img/gallery/gallery-1.jpg" alt="" class="img-fluid">
                        </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-md-4">
                     <div class="gallery-item">
                        <a href="Homepage/img/gallery/gallery-2.jpg" class="galelry-lightbox">
                        <img src="Homepage/img/gallery/gallery-2.jpg" alt="" class="img-fluid">
                        </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-md-4">
                     <div class="gallery-item">
                        <a href="Homepage/img/gallery/gallery-3.jpg" class="galelry-lightbox">
                        <img src="Homepage/img/gallery/gallery-3.jpg" alt="" class="img-fluid">
                        </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-md-4">
                     <div class="gallery-item">
                        <a href="Homepage/img/gallery/gallery-4.jpg" class="galelry-lightbox">
                        <img src="Homepage/img/gallery/gallery-4.jpg" alt="" class="img-fluid">
                        </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-md-4">
                     <div class="gallery-item">
                        <a href="Homepage/img/gallery/gallery-5.jpg" class="galelry-lightbox">
                        <img src="Homepage/img/gallery/gallery-5.jpg" alt="" class="img-fluid">
                        </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-md-4">
                     <div class="gallery-item">
                        <a href="Homepage/img/gallery/gallery-6.jpg" class="galelry-lightbox">
                        <img src="Homepage/img/gallery/gallery-6.jpg" alt="" class="img-fluid">
                        </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-md-4">
                     <div class="gallery-item">
                        <a href="Homepage/img/gallery/gallery-7.jpg" class="galelry-lightbox">
                        <img src="Homepage/img/gallery/gallery-7.jpg" alt="" class="img-fluid">
                        </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-md-4">
                     <div class="gallery-item">
                        <a href="Homepage/img/gallery/gallery-8.jpg" class="galelry-lightbox">
                        <img src="Homepage/img/gallery/gallery-8.jpg" alt="" class="img-fluid">
                        </a>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- End Gallery Section -->
         <!-- ======= Contact Section ======= -->
         <section id="contact" class="contact">
            <div class="container">
               <div class="section-title">
                  <h2>Contact</h2>
                  <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
               </div>
            </div>
            <div>
               <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" allowfullscreen></iframe>
            </div>
            <div class="container">
               <div class="row mt-5">
                  <div class="col-lg-4">
                     <div class="info">
                        <div class="address">
                           <i class="bi bi-geo-alt"></i>
                           <h4>Location:</h4>
                           <p>Bholaram Ustag Marge, Bhawarkua, Indore, M.P.</p>
                        </div>
                        <div class="email">
                           <i class="bi bi-envelope"></i>
                           <h4>Email:</h4>
                           <p>abhi@gmail.com</p>
                        </div>
                        <div class="phone">
                           <i class="bi bi-phone"></i>
                           <h4>Call:</h4>
                           <p>+91 9109964555</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-8 mt-5 mt-lg-0">
                     <form action="query.jsp" method="post" role="form" style="background-color:white; padding:4px;">
                        <div class="row">
                           <div class="col-md-6 form-group">
                              <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                           </div>
                           <div class="col-md-6 form-group mt-3 mt-md-0">
                              <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                           </div>
                        </div>
                        <div class="form-group mt-3">
                           <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
                        </div>
                        <div class="form-group mt-3">
                           <textarea class="form-control" name="msg" rows="5" placeholder="Message" id="msg" required></textarea>
                        </div>
                        <div class="text-center"><button type="submit" style="    margin-left: 25px;
						    background: #1977cc;
						    color: #fff;
						    border-radius: 50px;
						    padding: 8px 25px;
						    white-space: nowrap;
						    transition: 0.3s;
						    font-size: 14px;">Send Message</button>
						</div>
                     </form>
                  </div>
               </div>
            </div>
         </section>
         <!-- End Contact Section -->
      </main>
      <!-- End #main -->
      <!-- ======= Footer ======= -->
      <footer id="footer">
         <div class="footer-top">
            <div class="container">
               <div class="row">
                  <div class="col-lg-3 col-md-6 footer-contact">
                     <h3>Pharma<span class="text-warning">Care</span></h3>
                     <p>
                        Bholaram Ustag Marg,Bhawarkua<br>
                        Indore, M.P. <br>
                        India<br><br>
                        <strong>Phone:</strong> +91 9109964555<br>
                        <strong>Email:</strong> abhi@gmail.com<br>
                     </p>
                  </div>
                  <div class="col-lg-2 col-md-6 footer-links">
                     <h4>Useful Links</h4>
                     <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
                     </ul>
                  </div>
                  <div class="col-lg-3 col-md-6 footer-links">
                     <h4>Our Services</h4>
                     <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
                     </ul>
                  </div>
                  <div class="col-lg-4 col-md-6 footer-newsletter">
                     <h4>Join Our Newsletter</h4>
                     <p> Stay Healthy and Happy with Our Pharmacy! Your One-Stop Shop for Quality Medications and Expert Healthcare Advice! </p>
                     <form action="" method="post">
                        <input type="email" name="email"><input type="submit" value="Subscribe">
                     </form>
                  </div>
               </div>
            </div>
         </div>
         <div class="container d-md-flex py-4">
            <div class="me-md-auto text-center text-md-start">
               <div class="copyright">
                  &copy; Copyright <strong><span>Pharma<span class="text-warning">Care</span></span></strong>. All Rights Reserved
               </div>
               <div class="credits">
                  Designed by <a href="https://bootstrapmade.com/">Abhishek Rajpoot</a>
               </div>
            </div>
            <div class="social-links text-center text-md-right pt-3 pt-md-0">
               <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
               <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
               <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
               <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
               <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
            </div>
         </div>
      </footer>
      <!-- End Footer -->
      <div id="preloader"></div>
      <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
      <!-- Vendor JS Files -->
      <script src="Homepage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <script src="Homepage/vendor/glightbox/js/glightbox.min.js"></script>
      <script src="Homepage/vendor/php-email-form/validate.js"></script>
      <script src="Homepage/vendor/purecounter/purecounter.js"></script>
      <script src="Homepage/vendor/swiper/swiper-bundle.min.js"></script>
      <!-- Template Main JS File -->
      <script src="Homepage/js/main.js"></script>
      <%
         }
         else{
         response.sendRedirect("userlogin.jsp?msg=LoginFirst");
         } 
         %>
   </body>
</html>