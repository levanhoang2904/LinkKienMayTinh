<%@page import="bean.khachhangbean"%>
<%@page import="bo.giohangbo"%>
<%@page import="bean.sanphambean"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<style>
        .img-item {
            object-fit: cover;
        }


 		.item {
 			border: 1px solid blue;
 		margin-bottom: 20px !important;
 		border-radius: 5px;
 		}

       .img-product {
       	height: 297px !important;
       
       }
       p {
       	font-weight: bold;
       }
      

		.content {
		z-index: 3;
		}

		.title-item {
		height: 30px;
    max-width: 100%;
    overflow: hidden;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1;
}
       .item:hover {
       		
       		animation: move 1s ease forwards;
       }
       
       @keyframes move {
       		from {
       			transform: translateY(0);
       		} 
       		to {
       			transform: translateY(-14px);
       		}	
       
       }
      
      .alert {
      	z-index: 1;
	    margin: auto;
	    left: 50%;
	    transform: translateX(-50%);
      }
      
    </style>
</head>
<body>
	<% 
			giohangbo g = (giohangbo)session.getAttribute("gh");
			khachhangbean kh = (khachhangbean)session.getAttribute("dn");
			String err = "";
			if (request.getAttribute("err") != null) {
				err = (String)request.getAttribute("err");
			}
		%>
	
		<div class="app">
		
            <nav class="navbar navbar-expand-lg navbar-light bg-light position-relative">
            	<%if (err.equals("htgio")) {%>
            		<div class="alert alert-warning alert-dismissible fade show position-absolute text-center" role="alert">
				  <strong>Bạn chưa đăng nhập!</strong> Đăng nhập để xem giỏ hàng.
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  </button>
				</div>
				<% } %>
				
				<%if (err.equals("muahang")) {%>
            		<div class="alert alert-warning alert-dismissible fade show position-absolute text-center" role="alert">
				  <strong>Bạn chưa đăng nhập!</strong> Đăng nhập để thêm vào giỏ hàng.
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  </button>
				</div>
				<% } %>
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
        
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-5">
                        <li class="nav-item active">
                            <a class="nav-link" href="sanphamController">Trang chủ <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gioController">Giỏ Hàng
                        		<span class = "rounded bg-primary px-2 text-white" ><%= session.getAttribute("gh") != null ? g.ds.size() : "0" %></span>
                        	</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Sản phẩm
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <% ArrayList<loaibean>dsLoai = (ArrayList<loaibean>)request.getAttribute("dsLoai");
                            	int n = dsLoai.size();
                            	for (int i = 0; i < n; i++){
                            %>
                                <a class="dropdown-item" href="sanphamController?loai=<%= dsLoai.get(i).getMaLoai() %>"><%= dsLoai.get(i).getTenLoai() %></a>
                               <!--  <a class="dropdown-item" href="#">Bàn phím cơ</a>
                                
                                <a class="dropdown-item" href="#">Bán phím giả cơ</a> -->
                                <% } %>
                            </div>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="gioController">Xem lịch sử mua hàng
                        		
                        	</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0 mr-auto flex-grow-1" action = "sanphamController">
                        <input class="form-control mr-sm-2 flex-grow-1" type="search" name = "search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                    <% if (kh == null) { %>
                    <ul class="navbar-nav mr-0 ml-5">
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="modal" data-target="#exampleModal" href="#">Đăng nhập</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="modal" data-target="#registerModal" href="#">Đăng ký</a>
                        </li>
        
                    </ul>
                    <%} %>
                    <% if (kh != null) { %>
                    <ul class="navbar-nav mr-0 ml-5 align-items-center">
                    <li class="nav-item">
                            <a class="nav-link" data-toggle="modal" data-target="#exampleModal" href="#">Xin chào <%=kh.getHoten() %></a>
                        </li>
              
                    	<li class="nav-item">
                            <a class="nav-link"  href="dangxuatController?logout">Đăng xuất</a>
                        </li>
                    </ul>
                    <% } %>
                </div>
            </nav>
            <div id="carouselExampleIndicators" class="carousel slide w-75 m-auto mt-auto"
                style="height: 300px; margin-top: 30px !important;" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner h-100">
                    <div class="carousel-item  active h-100">
                        <img class="d-block w-100 img-item h-100"
                            src="./slider1.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item  h-100">
                        <img class="d-block w-100 img-item h-100"
                            src="https://vietgear.vn/wp-content/uploads/2020/09/keyboard-similator.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item  h-100">
                        <img class="d-block w-100 img-item h-100"
                            src="https://bizweb.dktcdn.net/100/376/459/articles/ban-phim-co-keychron-q1-qmk.jpg?v=1632305280333"
                            alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="container px-1 mt-5">
                <div class="list-items row h-100">
                <% ArrayList<sanphambean> ds = (ArrayList<sanphambean>)request.getAttribute("dssp");
                	
                	for (sanphambean sp : ds) {
                %>
               <div class = "col-4 h-100">
               		 <div class="item">
               
                        <div class="img-product h-100 w-100">
                            <img class="h-100 w-100 rounded" style = ""
                                src="./anh/<%= sp.getAnh() %>" alt="" />
                        </div>
                        <div class="content text-center">
                            <div class="title-item" style="max-width: 100%;">
                                <p><%= sp.getTensp() %></p>
                            </div>
                            <div class="price-item">
                                <p style="font-size: 16px;"><%= sp.getGia()%>đ</p>
                            </div>
                        
                        	<a href = "gioController?anh=<%= sp.getAnh() %>&tsp=<%= sp.getTensp() %>&gia=<%= sp.getGia()%>&masp=<%= sp.getMasp()%>&maloai=<%=sp.getMaLoai() %>"  class="btn btn-danger mb-5">Mua hàng</a>
                       
                       </div>

                    </div>
               </div>
                    
                    <% } %>
                
                   <!--  <div class="item overflow-hidden col-4 h-100">
                        <div class="img-product h-100 w-100">
                            <img class="h-100 w-100 rounded"
                                src="https://vn-live-01.slatic.net/p/ccb7d6fa07568f21d933dfdae4896fd2.jpg" alt="" />
                        </div>
                        <div class="content text-center d-none">
                            <div class="title-item" style="max-width: 100%;">
                                <h3>Bàn phím cơ za68 3 mode</h3>
                            </div>
                            <div class="price-item">
                                <p style="font-size: 18px;">700.000đ</p>
                            </div>
                        <button type="button" class="btn btn-danger">Mua hàng</button>
                        </div>
                    </div>
                    <div class="item overflow-hidden col-4 h-100">
                        <div class="img-product h-100 w-100">
                            <img class="h-100 w-100 rounded"
                                src="https://vn-live-01.slatic.net/p/ccb7d6fa07568f21d933dfdae4896fd2.jpg" alt="" />
                        </div>
                        <div class="content text-center d-none">
                            <div class="title-item">
                                <h3>Bàn phím cơ za68 3 mode</h3>
                            </div>
                            <div class="price-item">
                                <p style="font-size: 18px;">700.000đ</p>
                            </div>
                            <button type="button" class="btn btn-danger">Mua hàng</button>
                        </div>
                    </div>
                    <div class="item overflow-hidden col-4 h-100">
                        <div class="img-product h-100 w-100">
                            <img class="h-100 w-100 rounded"
                                src="https://vn-live-01.slatic.net/p/ccb7d6fa07568f21d933dfdae4896fd2.jpg" alt="" />
                        </div>
                        <div class="content text-center d-none">
                            <div class="title-item">
                                <h3>Bàn phím cơ za68 3 mode</h3>
                            </div>
                            <div class="price-item">
                                <p style="font-size: 18px;">700.000đ</p>
                            </div>
                            <button type="button" class="btn btn-danger">Mua hàng</button>
                        </div>
                    </div> -->
                </div>
               
            </div>
            <!-- footer -->
            <footer class="text-center text-lg-start bg-light text-muted">
                <!-- Section: Social media -->
                <section class="d-flex justify-content-center justify-content-lg-between mt-5 border-bottom">
                  <!-- Left -->
                  
                  <!-- Left -->
              
                  <!-- Right -->
                  <div>
                    <a href="" class="me-4 text-reset">
                      <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                      <i class="fab fa-twitter"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                      <i class="fab fa-google"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                      <i class="fab fa-instagram"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                      <i class="fab fa-linkedin"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                      <i class="fab fa-github"></i>
                    </a>
                  </div>
                  <!-- Right -->
                </section>
                <!-- Section: Social media -->
              
                <!-- Section: Links  -->
                <section class="">
                  <div class="container text-center text-md-start mt-5">
                    <!-- Grid row -->
                    <div class="row mt-3">
                      <!-- Grid column -->
                      <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <!-- Content -->
                        <h6 class="text-uppercase fw-bold mb-4">
                          <i class="fas fa-gem me-3"></i>Company name
                        </h6>
                        <p>
                          Here you can use rows and columns to organize your footer content. Lorem ipsum
                          dolor sit amet, consectetur adipisicing elit.
                        </p>
                      </div>
                      <!-- Grid column -->
              
                      <!-- Grid column -->
                      <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                          Products
                        </h6>
                        <p>
                          <a href="#!" class="text-reset">Angular</a>
                        </p>
                        <p>
                          <a href="#!" class="text-reset">React</a>
                        </p>
                        <p>
                          <a href="#!" class="text-reset">Vue</a>
                        </p>
                        <p>
                          <a href="#!" class="text-reset">Laravel</a>
                        </p>
                      </div>
                      <!-- Grid column -->
              
                      <!-- Grid column -->
                      <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                          Useful links
                        </h6>
                        <p>
                          <a href="#!" class="text-reset">Pricing</a>
                        </p>
                        <p>
                          <a href="#!" class="text-reset">Settings</a>
                        </p>
                        <p>
                          <a href="#!" class="text-reset">Orders</a>
                        </p>
                        <p>
                          <a href="#!" class="text-reset">Help</a>
                        </p>
                      </div>
                      <!-- Grid column -->
              
                      <!-- Grid column -->
                      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                        <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
                        <p>
                          <i class="fas fa-envelope me-3"></i>
                          info@example.com
                        </p>
                        <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
                        <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
                      </div>
                      <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                  </div>
                </section>
                <!-- Section: Links  -->
              
                <!-- Copyright -->
                <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                  © 2021 Copyright:
                  <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
                </div>
                <!-- Copyright -->
              </footer>
              
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Đăng nhập</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action = "dangnhapController">
                            <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input name = "email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Password</label>
                              <input name = "password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            
                            <button type="submit" class="btn btn-primary">Submit</button>
                          </form>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                     
                    </div>
                  </div>
                </div>
              </div>
        
              <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Đăng ký</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form action = "dangkyController">
                    <div class="modal-body">
                        
                      	  <div class="form-group">
                              <label for="exampleInputEmail1">Nhập họ tên</label>
                              <input name = "hoten" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                              
                            </div>
                            <div class="form-group">
                              <label for="exampleInputEmail1">Nhập Email</label>
                              <input name = "email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Nhập password</label>
                              <input name = "password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Nhập lại password</label>
                                <input name = "repass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                              </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Nhập địa chỉ</label>
                              <input name = "diachi" type="text" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                            
                    </div>
                          </form>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                     
                    </div>
                  </div>
                </div>
              </div>

        </div>
</body>
</html>