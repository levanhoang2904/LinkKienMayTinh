<%@page import="bean.khachhangbean"%>
<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
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
</head>
<body>
<% giohangbo g = (giohangbo)session.getAttribute("gh");
	giohangbo item = new giohangbo();
	khachhangbean kh = (khachhangbean)session.getAttribute("dn");
%>
		 <div class="cart">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
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
                            <a class="dropdown-item" href="#">Bàn phím văn phòng</a>
                            <a class="dropdown-item" href="#">Bàn phím cơ</a>
                            
                            <a class="dropdown-item" href="#">Bán phím giả cơ</a>
                        </div>
                    </li>
                     <li class="nav-item">
                            <a class="nav-link" href="gioController">Xem lịch sử mua hàng
                        		
                        	</a>
                        </li>
                </ul>
                <form class="form-inline my-2 my-lg-0 mr-auto flex-grow-1">
                    <input class="form-control mr-sm-2 flex-grow-1" type="search" placeholder="Search" aria-label="Search">
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
        <form action = "deleteController">
        
        <section class="h-100 h-custom" style="background-color: #eee;">
            <div class="container py-5 h-100">
              <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col">
                  <div class="card">
                    <div class="card-body p-4">
          
                      <div class="row flex-column">
          
                        <div class="col-lg-12">
                          <h5 class="mb-3">Giỏ hàng</h5>
                          <hr>
          
                          <div class="d-flex justify-content-between align-items-center mb-4">
                            <div>
                              <p class="mb-0">Bạn có <%= session.getAttribute("gh") != null ? g.ds.size() : "0" %> sản phẩm trong giỏ hàng</p>
                            </div>
                            <div>
                              <p class="mb-0"><span class="text-muted">Sắp xếp:</span> <a href="#!"
                                  class="text-body">Giá <i class="fas fa-angle-down mt-1"></i></a></p>
                            </div>
                          </div>
          					<% if (session.getAttribute("gh") != null && g.ds.size() != 0) {
          						
          						int n = g.ds.size();
          						for (int i = 0; i < n; i++) {
          					%>
                          <div class="card mb-3">
                            <div class="card-body">
                              <div class="d-flex justify-content-between">
                                <div class="d-flex flex-row align-items-center">
                                  <div class = "mr-2" >
                                    <input class = "mr-1" type="checkbox" name = "checkbox" value = "<%= g.ds.get(i).getMsp() %>">
                                    
                                    <img
                                      src="./anh/<%=g.ds.get(i).getAnh() %>"
                                      class="img-fluid rounded" alt="Shopping item" style="width: 65px;">
                                  </div>
                                  <div class="ms-3">
                                    <h5><%=g.ds.get(i).getTenSp() %></h5>
                                    <!-- <p class="small mb-0">256GB, Navy Blue</p> -->
                                  </div>
                                </div>
                                <div class="d-flex flex-row align-items-center">
                                   <div class="d-flex justify-content-center align-items-center mr-5" style="width: 50px;">
                                    <a  href = "editController?tru=<%= g.ds.get(i).getMsp() %>" style = "width: 40px;"  type = "text" class="btn btn-outline-primary mr-3" >-</a>
                                    <input style = "width: 40px; height: 37px;" class="fw-normal mb-0 mr-3" type = "number" value = "<%=g.ds.get(i).getSoluong()%>">
                                    <a href = "editController?cong=<%= g.ds.get(i).getMsp() %>" style = "width: 40px;" type = "text" class="btn btn-outline-primary mr-3" >+</a>
                                  </div>
                                  <div style="width: 80px;" class = "mr-3">
                                    <h5 class="ml-2 mb-0 w-100"><%= g.ds.get(i).getGia() %></h5>
                                  </div>
                                  <a href="gioController?deleteMsp=<%=g.ds.get(i).getMsp() %>" style="color: #cecece;"><i class="bi bi-trash3-fill"></i></a>
                                </div>
                              </div>
                            </div>
                          </div>
          				<% 		}	 
          					
          				%>
          				
                         
          				
                        </div>
                        <div class="col-lg-12 d-flex justify-content-between mt-5">
          
                          <div class="card w-50 bg-primary text-white rounded-3">
                            <div class="card-body">
                                
          
                              <div class="d-flex justify-content-between">
                                <p class="mb-2">Thành tiền</p>
                                <p class="mb-2"><%= g.thanhTien() %></p>
                              </div>
          
                              <div class="d-flex justify-content-between">
                                <p class="mb-2">Shipping</p>
                                <p class="mb-2">$20.00</p>
                              </div>
          
                              <div class="d-flex justify-content-between mb-4">
                                <p class="mb-2">Tổng tiền(Incl. taxes)</p>
                                <p class="mb-2">$4818.00</p>
                              </div>
          
                              <button type="button" class="btn btn-info btn-block btn-lg">
                                <div class="d-flex justify-content-between">
                                  <span>$4818.00</span>
                                  <span>Checkout <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                                  
                                </div>
                              </button>
          						<a href = "xacnhanController" class = "btn btn-danger mt-3">Đặt hàng</a>
                            </div>
                            
                          </div>
                         <div class = "delete">
                         	<button type = "submit" class = "btn btn-danger">Delete Items</button>
                         	 <a href = "deleteController?deleteAll" class = "btn btn-danger">Delete All</a>
                         </div>
          				<% } %>
                       
          				<% if (session.getAttribute("gh") == null || g.ds.size() == 0) { %>
          				<div class = "d-flex justify-content-center"><img class = "m-auto" src = "./empty-cart.png" /></div>
          			
                        </div>
          					<% } %>
                      </div>
          
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
          </form>
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
                        <form>
                            <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Password</label>
                              <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
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
                      <h5 class="modal-title" id="exampleModalLabel">Đăng nhập</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                              <label for="exampleInputEmail1">Nhập Email</label>
                              <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Nhập password</label>
                              <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Nhập lại password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
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
          
    </div>
</body>
</html>