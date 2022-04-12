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
					<h1>Product Page</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="index.php">Product</a></li>
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
								<label for="">Product Name</label> <input class="form-control"
									name="name" value="" required="required"
									placeholder=" Please Enter Product Name">
							</div>

							<div class="form-group">
								<label for="">Description</label>
								<textarea name="description" id="content" required="required"
									class="form-control" placeholder="Enter Description"></textarea>
							</div>

							<div class="form-group">
								<label for="">Image</label> <input name="image"
									required="required" class="form-control">
							</div>

						</div>






						<div class="col-md-3">
							<div class="form-group">
								<label for="">Price</label> <input class="form-control"
									name="price" value="" required="required"
									placeholder=" Please Enter Price">

							</div>

							<div class="form-group">
								<label for="">Sale_Price</label> <input class="form-control"
									name="sale_price" required="required" value=""
									placeholder=" Please Enter Sale Price">

							</div>

							<div class="form-group">
								<label for="">Category_id</label> <select name="categoryId"
									class="form-control" required="required">
									<option value="">--- Select One Category --</option>
									<c:forEach items="${cateAdd}" var="c">
										<option value="${c.id}" ${c.id == p.categoryId? "selected" : "" }>${c.name}</option>
									</c:forEach>
								</select>

							</div>

							<div class="form-group">
								<label for="">Created_at</label> <input class="form-control"
									name="created_at" required="required" value="" type="date">

							</div>



							<div class="form-group">
								<label for="">Status</label>
								<div class="radio" required="required">
									<label> <input type="radio" name="status" value="1">
										Sold Out
									</label> <label> <input type="radio" name="status" value="0">
										Stocking
									</label>
								</div>
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
