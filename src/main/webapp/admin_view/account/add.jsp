<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../../layouts/adHeader.jsp"%>
<%@include file="../../layouts/adSidebar.jsp"%>

<div class="content-wrapper">

	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Account Page</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="index.php">Account</a></li>
						<li class="breadcrumb-item active">Create</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<section class="content">
		<div class="card">
			<div class="card-header">

				<form action="/JSP_WebProject/Products?action=create" method="POST">

					<div class="row">
						<div class="col-md-9">

							<div class="form-group">
								<label for=""> Name</label> <input class="form-control"
									name="name" value="${p.name}" 
									placeholder=" Please Enter Product Name">
									<p style="color:red">${errName}</p>
							</div>

							<div class="form-group">
								<label for="">Email</label>
								<input name="description" id="content" 
									class="form-control" placeholder="Enter Description">
									<p style="color:red;">${errEmail}</p>
							</div>

							<div class="form-group">
								<label for="">Address</label> <input name="image"
									 class="form-control" value="${p.address}" >
									<p style="color:red;">${errAddress}</p>
							</div>

						</div>






						<div class="col-md-3">
						

							<div class="form-group">
								<label for="">Password</label> <input class="form-control"
									name="sale_price"  value="${p.password}"
									placeholder=" Please Enter Sale Price">
									<p style="color:red;">${errAddress}</p>
							</div>

							<div class="form-group">
								<label for="">Role</label> <select name="categoryId"
									class="form-control">
									<option value="">--- Select One Role --</option>
									<option value="1" >1</option>
									 <option value="2" >2</option>
									 <option value="3">3</option>
								</select>
								<p style="color:red;">${errCategoryId}</p>
							</div>

							

						</div>
						<a href="Products?action=index" class="btn btn-danger mr-3"
							style="opacity: 65%;"><i class="fa fa-arrow-circle-left"
							aria-hidden="true"></i> Back</a>
						<button type="submit" value="Insert" class="btn btn-primary">
							<i class="fa fa-save" aria-hidden="true"></i> Saved
						</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</div>




<%@include file="../../layouts/adFooter.jsp"%>
