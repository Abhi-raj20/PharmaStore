<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>	

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>HomePage</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  	
  <!-- alert -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>    
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
  <!-- Favicons -->
  <link rel="icon" type="image/png" href="Homepage/assets/img/favicon.png">
  
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <!-- Vendor CSS Files -->
  <link href="Homepage/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="Homepage/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="Homepage/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="Homepage/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="Homepage/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="Homepage/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <!-- Template Main CSS File -->
  <link href="Homepage/assets/css/style.css" rel="stylesheet"> 
</head>

<style>
	#hero{
		    background: url(Homepage/assets/img/pharmacy.jpg) top center;
	}
</style>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
    <div class="container-fluid">
      <div class="row justify-content-center" >
        <div class="col-xl-9 d-flex align-items-center justify-content-lg-between">
	 		<a href="index.html"  class="logo me-auto me-lg-0"><img src="Homepage/assets/img/iconlogo.png" alt="" class="img-fluid"></a>
         	<h2 class="logo me-auto me-lg-0" id="nav"><a href="index.jsp"  >Pharma<span class="text-warning">Care</span></a></h2>
          
          <nav id="navbar" class="navbar order-last order-lg-0">
            <ul>
              <li><a class="nav-link scrollto active" href="#hero" id="navbar">Home</a></li>
              <li><a class="nav-link scrollto" href="#about" id="navbar">About</a></li>
              <li><a class="nav-link scrollto" href="#services" id="navbar">Services</a></li>
              <li><a class="nav-link scrollto" href="#faq" id="navbar">FAQ</a></li>
              
              <li class="dropdown"><a href="#"id="navbar"><span>LOGIN</span> <i class="bi bi-chevron-down"></i></a>
                <ul>
                  <li><a href="userlogin.jsp">CUSTOMER</a></li>
                  <li><a href="adminlogin.jsp">ADMIN</a></li>                  
                </ul>
              </li>
			  <li class="dropdown"><a href="#" id="navbar"><span>REGISTER</span> <i class="bi bi-chevron-down"></i></a>
                <ul>
                  <li><a href="userregistration.jsp">CUSTOMER</a></li>
                  <li><a href="adminregistration.jsp">ADMIN</a></li>                  
                </ul>
              </li>
              <li><a class="nav-link scrollto" href="#contact" id="navbar">Contact Us</a></li>
            </ul>
		
            <i class="bi bi-list mobile-nav-toggle"></i>
          </nav>
          <!-- .navbar -->
                    
        </div>
      </div>
    </div>
  </header>
 <!-- End Header -->

  <!-- ======= Home Section ======= -->
  <section id="hero" class="d-flex flex-column justify-content-center">
    <div class="container">   
				
				<c:if test="${param.msg == 'logoutSuccess'}">
					<c:set var="message" value="Logout successful !!!"/>
				</c:if>
				
				<c:if test="${not empty message}">
					<script>
						if ("${message}" !== "") {
					    	swal({
					    	    title: 'Message From Server',
					            text: '${message.trim()}',
					            icon: 'success'
						    });
						}
					</script>
				</c:if>
				
      <div class="row justify-content-center">
        <div class="col-xl-8">
         
          <h1>Your Health, Our Priority</h1>
          <h2>Bringing Quality Medications to Your Doorstep.</h2>
          
        </div>
      </div>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="section-title">
          <h2 style="text-align:center">About Us</h2>
          <p>An E-Pharmacy that operates over the
	internet by selling medications & health-care needs to the
	customers.</p>
        </div>

        <div class="row content">
          <div class="col-lg-6">
            <p>
              It is easy to order online medicines with
		prescription. Individuals who live great distances from a
		terrestrial pharmacy, the elderly, disabled persons, and those
		whose daily schedule includes additional hassles, all can
		benefit from the easy and fast purchasing of medicines
		online. Additionally, shipping charges are often less than the
		expense incurred from travel costs associated with a visit to
		a traditional pharmacy
            </p>
            <ul>
              <li><i class="ri-check-double-line"></i> Processing of Prescriptions</li>
              <li><i class="ri-check-double-line"></i> Care of Patients</li>
              <li><i class="ri-check-double-line"></i> Future vision</li>
	      <li><i class="ri-check-double-line"></i> Range of Choices</li>	
            </ul>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0">
            <p>
                Under Digital India initiative, Jan
                Aushidhi Program the governments takes initiative to create
		awareness & provide access of affordable medicines to the
		general public which compromising to good quality drugs.
		The operating model of E-pharmacy which has mobile &
		web based applications, directly linked to inventory &
		dispensing existing at Jan Aushadhi Stores.
            </p>
            <a href="#" class="btn-learn-more">Learn More</a>
          </div>
        </div>

      </div>
    </section><!-- End About Us Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container">

        <div class="section-title">
          <h2 style="text-align:center">Services</h2>
          <p> In case you're looking to transition purchasing prescriptions from a storefront location, we've chosen the best online pharmacies to meet your needs.</p>
        </div>

        <div class="row">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-arch"></i></div>
              <h4><a href="">Transparency and patient choice</a></h4>
              <p>Transparency gives people the information they need to make informed decisions.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-file"></i></div>
              <h4><a href="">Managing medicines safely</a></h4>
              <p>A risk assessment will help pharmacy owners to identify and manage risks by looking at what could cause harm and what needs to be done to minimise them.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-tachometer"></i></div>
              <h4><a href="">Identity checking</a></h4>
              <p>It is important that the pharmacy has robust systems in place for pharmacy staff to verify a person’s identity when appropriate.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-world"></i></div>
              <h4><a href="">Supplying medicines safely</a></h4>
              <p>The delivery of medicines can provide a vital service to those unable to visit a pharmacy.</p>
            </div>
          </div>

          
          </div>

        </div>
    </section>
<!-- End Services Section -->
    

    <!-- ======= Faq Section ======= -->
    <section id="faq" class="faq">
      <div class="container-fluid">
        <div class="row">
        
          <div class="col-lg-7 d-flex flex-column justify-content-center align-items-stretch  order-2 order-lg-1">
            <div class="content" style="item-align:center">
              <h3 style="text-align:center">Frequently Asked <strong>Questions</strong></h3>
              <p>
               We are dedicated to providing a seamless shopping experience to all our customers. To help guide you through your daily medications, we have compiled a list of frequently asked questions and provided answers below.
              </p>
            </div>

            <div class="accordion-list">
              <ul>
                <li>
                  <a data-bs-toggle="collapse" class="collapse" data-bs-target="#accordion-list-1">Does it really matter what time of day you take medications? <i class="bx bx-chevron-down icon-show"></i>
		  	<i class="bx bx-chevron-up icon-close"></i></a>
                  <div id="accordion-list-1" class="collapse show" data-bs-parent=".accordion-list">
                    <p>
                      Yes, a dosing schedule is important, because every medication that you take has a specific dosing schedule — once a day, three times a day, etc.
                    </p>
                  </div>
                </li>

                <li>
                  <a data-bs-toggle="collapse" data-bs-target="#accordion-list-2" class="collapsed">How should medicines be stored? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
                  <div id="accordion-list-2" class="collapse" data-bs-parent=".accordion-list">
                    <p>
		    Keep medications in a safe place and out of the reach of children and pets. Some medications need to be refrigerated, but the majority do not, and you can keep them in a dry place that’s not exposed to temperature extremes.
                    </p>
                  </div>
                </li>

                <li>
                  <a data-bs-toggle="collapse" data-bs-target="#accordion-list-3" class="collapsed">What if medications make me too sleepy? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
                  <div id="accordion-list-3" class="collapse" data-bs-parent=".accordion-list">
                    <p>
                      Some prescription and over-the-counter medications can make you drowsy. There are a lot of medications that are sedating, and that can lead to issues with balance. Dosing schedules are important when trying to avoid daytime drowsiness caused by certain medications.
                    </p>
                  </div>
                </li>

              </ul>
            </div>

          </div>

          <div class="col-lg-5 align-items-stretch order-1 order-lg-2 img" style='background-image: url("assets/img/faq.jpg");'>&nbsp;</div>
        </div>

      </div>
    </section>
	
     <!-- End Faq Section -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container">

        <div class="section-title">
          <h2>Contact</h2>
          <p>Dedicated to giving our customers what they need when they need it.Customer satisfaction above all else, whenever you need us we're here for you and your family.Please reach us at </p>
        </div>
      </div>

     

      <div class="container">

        <div class="row mt-5">

          <div class="col-lg-4">
            <div class="info">
              <div class="address">
                <i class="ri-map-pin-line"></i>
                <h4>Location:</h4>
                <p>Bholaram Ustag marge, Bhawarkua, Indore, M.P. 452011 </p>
              </div>

              <div class="email">
                <i class="ri-mail-line"></i>
                <h4>Email:</h4>
                <p>abhi@gmail.com</p>
              </div>

              <div class="phone">
                <i class="ri-phone-line"></i>
                <h4>Call:</h4>
                <p>+91 9109964555</p>
              </div>

            </div>

          </div>

          <div class="col-lg-8 mt-5 mt-lg-0">

            <form action="query.jsp" method="post" role="form" class="php-email-form" style="background-color:white; padding:4px;">
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
                <textarea class="form-control" name="message" rows="5" placeholder="Message" id="msg" required></textarea>
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
    </section><!-- End Contact Section -->

  </main>
<!-- End #main -->

  <!--  -------Footer------- -->

  <footer id="footer">
    <div class="container">
      <h3>Pharma<span class="text-warning">Care</span></h3>
      <p> A pharmacy that never breaks your trust.</p>
      <div class="social-links">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
      <div class="copyright">
        &copy; Copyright <strong><span>2024</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/knight-simple-one-page-bootstrap-template/ -->
        Designed by <a href="https://bootstrapmade.com/">Abhishek Rajpoot</a>
      </div>
    </div>
  </footer>

<!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="Homepage/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="Homepage/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="Homepage/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="Homepage/assets/vendor/php-email-form/validate.js"></script>
  <script src="Homepage/assets/vendor/purecounter/purecounter.js"></script>
  <script src="Homepage/assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="Homepage/assets/js/main.js"></script>

</body>

</html>